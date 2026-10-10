$ErrorActionPreference = 'Stop'

function Assert([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}
function Invoke-Script([string]$Script, [string[]]$Arguments) {
    & (Get-Process -Id $PID).Path -NoProfile -File $Script @Arguments | Out-Host
    return $LASTEXITCODE
}
function Write-Bytes([string]$Path, [byte[]]$Bytes) {
    $parent = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $parent -PathType Container)) { [void](New-Item -ItemType Directory -Path $parent -Force) }
    [IO.File]::WriteAllBytes($Path, $Bytes)
}
function Equal-Bytes([string]$Path, [byte[]]$Bytes) {
    return [System.Collections.StructuralComparisons]::StructuralEqualityComparer.Equals([IO.File]::ReadAllBytes($Path), $Bytes)
}
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$temp = Join-Path ([IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString('N'))
$source = Join-Path $temp 'source'
$targetHome = Join-Path $temp 'home'
$repo = Join-Path $temp 'repo'
[void](New-Item -ItemType Directory -Path $source, $targetHome, $repo)
try {
    $agents = [byte[]](0x41, 0x00, 0x42, 0x0A)
    $config = [byte[]](0x43, 0x00, 0x44, 0x0A)
    $other = [byte[]](0x4F, 0x54, 0x48, 0x45, 0x52)
    Write-Bytes (Join-Path $source 'payload/agents') $agents
    Write-Bytes (Join-Path $source 'payload/config') $config
    Write-Bytes (Join-Path $source 'payload/other') $other
    $inventory = @("payload/agents`t.omp/agent/AGENTS.md", "payload/config`t.omp/agent/config.yml", "payload/other`t.keep.bin") -join "`n"
    [IO.File]::WriteAllText((Join-Path $source 'files.tsv'), $inventory)
    [void](New-Item -ItemType Directory -Path (Join-Path $source 'config'))
    Move-Item -LiteralPath (Join-Path $source 'files.tsv') -Destination (Join-Path $source 'config/files.tsv')
    Write-Bytes (Join-Path $targetHome 'keep.bin') $other

    $install = Join-Path $root 'install.ps1'
    $code = Invoke-Script $install @('-DryRun', '-Source', $source, '-Home', $targetHome)
    Assert ($code -eq 0) 'Install dry-run rejected the forward-slash inventory.'
    Assert (-not (Test-Path -LiteralPath (Join-Path $targetHome '.omp'))) 'Dry-run created destination directories.'
    $code = Invoke-Script $install @('-Source', $source, '-Home', $targetHome)
    Assert ($code -eq 0) 'Install rejected the forward-slash inventory.'
    Assert (Equal-Bytes (Join-Path $targetHome '.omp/agent/AGENTS.md') $agents) 'Installed AGENTS.md bytes differ.'
    Assert (Equal-Bytes (Join-Path $targetHome '.omp/agent/config.yml') $config) 'Installed config.yml bytes differ.'
    Assert (Equal-Bytes (Join-Path $targetHome 'keep.bin') $other) 'Install changed unrelated content.'

    $repoConfig = Join-Path $repo 'config'
    $repoScripts = Join-Path $repo 'scripts'
    [void](New-Item -ItemType Directory -Path $repoConfig, $repoScripts)
    Copy-Item -LiteralPath (Join-Path $root 'scripts/doctor.ps1') -Destination (Join-Path $repoScripts 'doctor.ps1')
    Copy-Item -LiteralPath (Join-Path $source 'config/files.tsv') -Destination (Join-Path $repoConfig 'files.tsv')
    foreach ($relative in @('payload/agents', 'payload/config', 'payload/other')) {
        Write-Bytes (Join-Path $repo $relative) ([IO.File]::ReadAllBytes((Join-Path $source $relative)))
    }
    Copy-Item -LiteralPath (Join-Path $root 'install.ps1') -Destination (Join-Path $repo 'install.ps1')
    $doctor = Join-Path $repoScripts 'doctor.ps1'
    $code = Invoke-Script $doctor @('-Check', '-Home', $targetHome)
    Assert ($code -eq 0) 'Doctor check rejected or reported drift for valid inventory.'
    $drift = [byte[]](0x44, 0x52, 0x49, 0x46, 0x54)
    Write-Bytes (Join-Path $targetHome '.omp/agent/config.yml') $drift
    $code = Invoke-Script $doctor @('-Fix', '-Home', $targetHome)
    Assert ($code -eq 0) 'Doctor fix failed to repair drift.'
    Assert (Equal-Bytes (Join-Path $targetHome '.omp/agent/config.yml') $config) 'Doctor fix wrote incorrect bytes.'
    $backups = @(Get-ChildItem -LiteralPath (Join-Path $targetHome '.omp/agent') -Filter 'config.yml.bak.*' -File)
    Assert ($backups.Count -eq 1) 'Doctor fix did not create exactly one backup.'
    Assert (Equal-Bytes $backups[0].FullName $drift) 'Doctor backup did not preserve drift bytes.'
    Assert (Equal-Bytes (Join-Path $targetHome 'keep.bin') $other) 'Doctor changed unrelated content.'

    $bad = Join-Path $temp 'bad-source'
    [void](New-Item -ItemType Directory -Path $bad)
    Write-Bytes (Join-Path $bad 'payload/agents') $agents
    Write-Bytes (Join-Path $bad 'payload/config') $config
    [void](New-Item -ItemType Directory -Path (Join-Path $bad 'config'))
    [IO.File]::WriteAllText((Join-Path $bad 'config/files.tsv'), "payload/agents`t.omp/agent/AGENTS.md`npayload/config`telsewhere/file")
    $emptyHome = Join-Path $temp 'empty-home'
    [void](New-Item -ItemType Directory -Path $emptyHome)
    $code = Invoke-Script $install @('-Source', $bad, '-Home', $emptyHome)
    Assert ($code -ne 0) 'Install accepted inventory missing a required mapping.'
    Assert (-not (Test-Path -LiteralPath (Join-Path $emptyHome '.omp'))) 'Rejected inventory wrote before validation.'
    Copy-Item -LiteralPath (Join-Path $bad 'config/files.tsv') -Destination (Join-Path $repoConfig 'files.tsv')
    $code = Invoke-Script $doctor @('-Fix', '-Home', $targetHome)
    Assert ($code -ne 0) 'Doctor accepted inventory missing a required mapping.'
    Assert (Equal-Bytes (Join-Path $targetHome '.omp/agent/AGENTS.md') $agents) 'Doctor wrote before rejecting inventory.'
    Assert (Equal-Bytes (Join-Path $targetHome '.omp/agent/config.yml') $config) 'Doctor changed config before rejecting inventory.'


    Write-Output 'PowerShell install integration regression passed.'
} finally {
    if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Recurse -Force }
}
