$ErrorActionPreference = 'Stop'

function Fail([string]$Message) { [Console]::Error.WriteLine($Message); exit 2 }
function EqualBytes([byte[]]$A, [byte[]]$B) { return [System.Collections.StructuralComparisons]::StructuralEqualityComparer.Equals($A, $B) }
function Is-Reparse([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return $false }
    return ((Get-Item -LiteralPath $Path -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0
}
function Read-Inventory([string]$Path, [string]$Root, [string]$TargetHome) {
    $rootPrefix = [IO.Path]::GetFullPath($Root).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    $homePrefix = [IO.Path]::GetFullPath($TargetHome).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    $items = New-Object 'System.Collections.Generic.List[object]'
    $destinations = @{}
    $lineNumber = 0
    foreach ($line in [IO.File]::ReadAllLines($Path)) {
        $lineNumber++
        $columns = $line.Split([char[]]@("`t"), [StringSplitOptions]::None)
        if ($columns.Count -ne 2 -or [string]::IsNullOrEmpty($columns[0]) -or [string]::IsNullOrEmpty($columns[1])) { throw "Malformed inventory line $lineNumber." }
        foreach ($entry in $columns) {
            if ([IO.Path]::IsPathRooted($entry) -or $entry -match '(^|[\\/])\.\.([\\/]|$)' -or $entry -match '(^|[\\/])\.([\\/]|$)' -or $entry -match '(^|[\\/])[\\/]|[\\/](?:$)' -or $entry.Contains(':') -or $entry.Contains("`r") -or $entry.Contains("`n")) { throw "Unsafe inventory path on line $lineNumber." }
        }
        $sourceRelative = $columns[0].Replace('/', [IO.Path]::DirectorySeparatorChar)
        $destinationRelative = $columns[1].Replace('/', [IO.Path]::DirectorySeparatorChar)
        if ($destinations.ContainsKey($destinationRelative)) { throw "Duplicate inventory destination: $($columns[1])" }
        $destinations[$destinationRelative] = $true
        $source = [IO.Path]::GetFullPath((Join-Path $Root $sourceRelative))
        if (-not $source.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $source -PathType Leaf) -or (Is-Reparse $source)) { throw "Missing, unsafe, or non-regular source: $source" }
        $sourceItem = Get-Item -LiteralPath $source -Force
        if (($sourceItem.Attributes -band [IO.FileAttributes]::Directory) -ne 0) { throw "Source is not a regular file: $source" }
        $sourceParent = Split-Path -Parent $source
        while ($sourceParent -and $sourceParent.StartsWith($Root, [StringComparison]::OrdinalIgnoreCase)) {
            if (Is-Reparse $sourceParent) { throw "Source path contains a symlink/reparse point: $sourceParent" }
            if ($sourceParent -eq $Root) { break }
            $sourceParent = Split-Path -Parent $sourceParent
        }
        $bytes = [IO.File]::ReadAllBytes($source)
        if (($columns[0] -eq 'config/agent/config.yml' -or $columns[0] -eq 'config/agent/AGENTS.md') -and $bytes.Length -eq 0) { throw "Required source is empty: $source" }
        $destination = [IO.Path]::GetFullPath((Join-Path $TargetHome $destinationRelative))
        if (-not $destination.StartsWith($homePrefix, [StringComparison]::OrdinalIgnoreCase)) { throw "Destination escapes home: $destination" }
        $parent = Split-Path -Parent $destination
        while ($parent -and $parent.StartsWith($TargetHome, [StringComparison]::OrdinalIgnoreCase)) {
            if (Test-Path -LiteralPath $parent) {
                if (Is-Reparse $parent) { throw "Destination parent is a symlink/reparse point: $parent" }
                if (-not (Test-Path -LiteralPath $parent -PathType Container)) { throw "Destination parent is not a directory: $parent" }
            }
            if ($parent -eq $TargetHome) { break }
            $parent = Split-Path -Parent $parent
        }
        if (Test-Path -LiteralPath $destination) {
            if ((Is-Reparse $destination) -or -not (Test-Path -LiteralPath $destination -PathType Leaf) -or (Get-Item -LiteralPath $destination -Force).PSIsContainer) { throw "Destination is not a regular file: $destination" }
            $actual = [IO.File]::ReadAllBytes($destination)
        } else { $actual = $null }
        $items.Add(@{ Source = $source; Destination = $destination; Bytes = $bytes; Actual = $actual })
    }
    if ($items.Count -eq 0) { throw 'Inventory is empty.' }
    $requiredAgents = '.omp/agent/AGENTS.md'.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $requiredConfig = '.omp/agent/config.yml'.Replace('/', [IO.Path]::DirectorySeparatorChar)
    if (-not $destinations.ContainsKey($requiredAgents) -or -not $destinations.ContainsKey($requiredConfig)) { throw 'Inventory must include AGENTS.md and config.yml.' }
    return ,$items
}
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
