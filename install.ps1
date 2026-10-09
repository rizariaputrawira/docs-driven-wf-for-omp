$ErrorActionPreference = 'Stop'

function Fail([string]$Message) { [Console]::Error.WriteLine($Message); exit 2 }
. (Join-Path $PSScriptRoot 'scripts/validate-inventory.ps1')
. (Join-Path $PSScriptRoot 'scripts/telemetry-profiles.ps1')


$dryRun = $false; $homeOverride = $null; $sourceOverride = $null; $help = $false
for ($i = 0; $i -lt $args.Count; $i++) {
    $arg = [string]$args[$i]
    if ($arg -ieq '-Help' -or $arg -ieq '-?') { $help = $true; continue }
    if ($arg -ieq '-DryRun') { $dryRun = $true; continue }
    if ($arg -ieq '-Home' -or $arg -ieq '-Source') {
        if ($i + 1 -ge $args.Count -or [string]::IsNullOrEmpty([string]$args[$i + 1]) -or ([string]$args[$i + 1]).StartsWith('-')) { Fail 'Usage: install.ps1 [-DryRun] [-Source path|url] [-Home path]' }
        if ($arg -ieq '-Home') { $homeOverride = [string]$args[++$i] } else { $sourceOverride = [string]$args[++$i] }
        continue
    }
    Fail "Unknown argument: $arg"
}
if ($help) { Write-Output 'Usage: install.ps1 [-DryRun] [-Source path|url] [-Home path]'; exit 0 }

$tempRoot = $null
try {
    $repository = (Resolve-Path -LiteralPath $PSScriptRoot).Path
    $sourcePath = if ($null -ne $sourceOverride) { $sourceOverride } else { $repository }
    if ($sourcePath -match '^https?://') {
        $tempRoot = Join-Path ([IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString())
        [void](New-Item -ItemType Directory -Path $tempRoot)
        $archive = Join-Path $tempRoot 'source.zip'
        Invoke-WebRequest -Uri $sourcePath -OutFile $archive
        $expanded = Join-Path $tempRoot 'expanded'
        Expand-Archive -LiteralPath $archive -DestinationPath $expanded
        $roots = @(Get-ChildItem -LiteralPath $expanded -Force)
        if ($roots.Count -ne 1 -or -not $roots[0].PSIsContainer) { throw 'Archive must contain exactly one root directory.' }
        $sourcePath = $roots[0].FullName
    }
    if (-not (Test-Path -LiteralPath $sourcePath -PathType Container) -or (Is-Reparse $sourcePath)) { throw 'Source must be an existing real directory.' }
    $sourceRoot = (Resolve-Path -LiteralPath $sourcePath).Path
    $homePath = if ($null -ne $homeOverride) { $homeOverride } else { $env:USERPROFILE }
    if ([string]::IsNullOrEmpty($homePath) -or -not (Test-Path -LiteralPath $homePath -PathType Container) -or (Is-Reparse $homePath)) { throw 'Home must be an existing real directory.' }
    $targetHome = (Resolve-Path -LiteralPath $homePath).Path
    $inventory = Join-Path $sourceRoot 'config/files.tsv'
    if (-not (Test-Path -LiteralPath $inventory -PathType Leaf) -or (Is-Reparse $inventory)) { throw "Missing or unsafe inventory: $inventory" }
    $profiles = @(Get-TelemetryProfilePlan $targetHome)
    $items = Read-Inventory $inventory $sourceRoot $targetHome
    foreach ($item in $items) {
        if ($null -ne $item.Actual -and (EqualBytes $item.Bytes $item.Actual)) { Write-Output "unchanged: $($item.Destination)"; continue }
        if ($dryRun) { Write-Output "would install: $($item.Destination)"; continue }
        $directory = Split-Path -Parent $item.Destination
        if (-not (Test-Path -LiteralPath $directory -PathType Container)) { [void](New-Item -ItemType Directory -Path $directory -Force) }
        if (Test-Path -LiteralPath $item.Destination) {
            $stamp = [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ')
            $backup = "$($item.Destination).bak.$stamp"
            $suffix = 0
            while (Test-Path -LiteralPath $backup) { $suffix++; $backup = "$($item.Destination).bak.$stamp.$suffix" }
            [IO.File]::Copy($item.Destination, $backup)
            Write-Output "backup: $backup"
        }
        [IO.File]::WriteAllBytes($item.Destination, $item.Bytes)
        Write-Output "installed: $($item.Destination)"
    }
    Install-TelemetryProfiles $profiles $dryRun
} catch { [Console]::Error.WriteLine($_.Exception.Message); exit 2 }
finally { if ($tempRoot -and (Test-Path -LiteralPath $tempRoot)) { Remove-Item -LiteralPath $tempRoot -Recurse -Force } }
