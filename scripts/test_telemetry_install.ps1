$ErrorActionPreference = 'Stop'
function Assert([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
function Run-Script([string]$Script, [string[]]$Arguments, [int]$Expected = 0) {
    & (Get-Process -Id $PID).Path -NoProfile -File $Script @Arguments | Out-Host
    Assert ($LASTEXITCODE -eq $Expected) "Unexpected exit code for $Script`: $LASTEXITCODE"
}
$root = Split-Path -Parent $PSScriptRoot
$temp = Join-Path ([IO.Path]::GetTempPath()) ('docflow-telemetry-' + [guid]::NewGuid().ToString('N'))
$homePath = Join-Path $temp 'home with spaces'
[void](New-Item -ItemType Directory -Path $homePath -Force)
try {
    $profile = Join-Path $homePath 'Documents/PowerShell/profile.ps1'
    [void](New-Item -ItemType Directory -Path (Split-Path -Parent $profile) -Force)
    $encoding = [Text.Encoding]::Unicode
    [byte[]]$prefix = $encoding.GetPreamble() + $encoding.GetBytes("# User preference`r`n`$env:USER_VALUE = 'kept'")
    [IO.File]::WriteAllBytes($profile, $prefix)
    $install = Join-Path $root 'install.ps1'
    $doctor = Join-Path $root 'scripts/doctor.ps1'
    Run-Script $install @('-DryRun', '-Home', $homePath)
    Assert (-not (Test-Path -LiteralPath (Join-Path $homePath '.omp'))) 'Dry-run wrote a payload.'
    Assert ([Convert]::ToBase64String([IO.File]::ReadAllBytes($profile)) -eq [Convert]::ToBase64String($prefix)) 'Dry-run changed a profile.'
    Run-Script $install @('-Home', $homePath)
    $bytes = [IO.File]::ReadAllBytes($profile)
    for ($i = 0; $i -lt $prefix.Length; $i++) { Assert ($bytes[$i] -eq $prefix[$i]) 'Existing profile bytes were changed.' }
    $errors = $null; $tokens = $null
    [void][Management.Automation.Language.Parser]::ParseFile($profile, [ref]$tokens, [ref]$errors)
    Assert ($errors.Count -eq 0) 'Augmented UTF-16 profile no longer parses.'
    $backup = @(Get-ChildItem -LiteralPath (Split-Path -Parent $profile) -Filter 'profile.ps1.bak.*')
    Assert ($backup.Count -eq 1) 'Changed profile must have one backup.'
    Assert ([Convert]::ToBase64String([IO.File]::ReadAllBytes($backup[0].FullName)) -eq [Convert]::ToBase64String($prefix)) 'Backup changed original bytes.'
    $mtime = [IO.File]::GetLastWriteTimeUtc($profile)
    Run-Script $install @('-Home', $homePath)
    Assert ([IO.File]::GetLastWriteTimeUtc($profile) -eq $mtime) 'Identical install changed profile timestamp.'
    Run-Script $doctor @('-Check', '-Home', $homePath)
    Remove-Item -LiteralPath $profile
    Run-Script $doctor @('-Check', '-Home', $homePath) 1
    Run-Script $doctor @('-Fix', '-Home', $homePath)
    $env:DO_NOT_TRACK = '0'; $env:RTK_TELEMETRY_DISABLED = '0'
    $env:PI_AUTO_QA = '1'; $env:PI_AUTO_QA_PUSH = '1'
    $env:POSTHOG_KEY = 'test-enabled'; $env:LANGFUSE_PUBLIC_KEY = 'test-enabled'
    $env:LANGFUSE_SECRET_KEY = 'test-enabled'; $env:OPEN_DESIGN_TELEMETRY_RELAY_URL = 'https://example.invalid'
    $env:OPENAI_API_KEY = 'provider-sentinel'
    . (Join-Path $homePath '.omp/telemetry.ps1')
    Assert ($env:DO_NOT_TRACK -eq '1' -and $env:OTEL_SDK_DISABLED -eq 'true') 'Native/OTel opt-outs not effective.'
    Assert ($env:RTK_TELEMETRY_DISABLED -eq '1' -and $env:NEXT_TELEMETRY_DISABLED -eq '1') 'Dependency opt-outs not effective.'
    Assert ($env:PI_AUTO_QA -eq '0' -and $env:PI_AUTO_QA_PUSH -eq '0') 'AutoQA enable overrides survived.'
    Assert (-not $env:POSTHOG_KEY -and -not $env:LANGFUSE_PUBLIC_KEY -and -not $env:LANGFUSE_SECRET_KEY -and -not $env:OPEN_DESIGN_TELEMETRY_RELAY_URL) 'Optional telemetry destinations survived.'
    Assert ($env:OPENAI_API_KEY -eq 'provider-sentinel') 'Provider authentication was modified.'
    $invalidHome = Join-Path $temp 'invalid home'
    [void](New-Item -ItemType Directory -Path (Join-Path $invalidHome 'Documents/PowerShell') -Force)
    [IO.File]::WriteAllText((Join-Path $invalidHome 'Documents/PowerShell/profile.ps1'), "# >>> omp telemetry opt-out >>>`r`n# <<< omp telemetry opt-out <<<")
    Run-Script $install @('-Home', $invalidHome) 2
    Assert (-not (Test-Path -LiteralPath (Join-Path $invalidHome '.omp'))) 'Invalid profile wrote payload before validation.'
    Write-Output 'PowerShell telemetry installation integration checks passed.'
} finally {
    Remove-Item -LiteralPath $temp -Recurse -Force
}
