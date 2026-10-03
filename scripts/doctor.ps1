$ErrorActionPreference = 'Stop'

function Fail([string]$Message) { [Console]::Error.WriteLine($Message); exit 2 }
function EqualBytes([byte[]]$A, [byte[]]$B) {
    if ($A.Length -ne $B.Length) { return $false }
    for ($i = 0; $i -lt $A.Length; $i++) { if ($A[$i] -ne $B[$i]) { return $false } }
    return $true
}
function Is-Reparse([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return $false }
    return ((Get-Item -LiteralPath $Path -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0
}
function Read-Inventory([string]$Path, [string]$Repository, [string]$TargetHome) {
    $repoPrefix = [IO.Path]::GetFullPath($Repository).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
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
        $source = [IO.Path]::GetFullPath((Join-Path $Repository $sourceRelative))
        if (-not $source.StartsWith($repoPrefix, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $source -PathType Leaf) -or (Is-Reparse $source)) { throw "Missing, unsafe, or non-regular source: $source" }
        $sourceItem = Get-Item -LiteralPath $source -Force
        if (($sourceItem.Attributes -band [IO.FileAttributes]::Directory) -ne 0) { throw "Source is not a regular file: $source" }
        $sourceParent = Split-Path -Parent $source
        while ($sourceParent -and $sourceParent.StartsWith($Repository, [StringComparison]::OrdinalIgnoreCase)) {
            if (Is-Reparse $sourceParent) { throw "Source path contains a symlink/reparse point: $sourceParent" }
            if ($sourceParent -eq $Repository) { break }
            $sourceParent = Split-Path -Parent $sourceParent
        }
        $expected = [IO.File]::ReadAllBytes($source)
        if (($columns[0] -eq 'config/agent/config.yml' -or $columns[0] -eq 'config/agent/AGENTS.md') -and $expected.Length -eq 0) { throw "Required source is empty: $source" }
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
        $items.Add(@{ Source = $source; Destination = $destination; Expected = $expected; Actual = $actual })
    }
    if ($items.Count -eq 0) { throw 'Inventory is empty.' }
    if (-not $destinations.ContainsKey('.omp/agent/AGENTS.md') -or -not $destinations.ContainsKey('.omp/agent/config.yml')) { throw 'Inventory must include AGENTS.md and config.yml.' }
    return ,$items
}

$check = $false; $fix = $false; $homeOverride = $null; $help = $false
for ($i = 0; $i -lt $args.Count; $i++) {
    $arg = [string]$args[$i]
    if ($arg -ieq '-Help' -or $arg -ieq '-?') { $help = $true; continue }
    if ($arg -ieq '-Check') { $check = $true; continue }
    if ($arg -ieq '-Fix') { $fix = $true; continue }
    if ($arg -ieq '-Home') {
        if ($i + 1 -ge $args.Count -or [string]::IsNullOrEmpty([string]$args[$i + 1]) -or ([string]$args[$i + 1]).StartsWith('-')) { Fail 'Usage: doctor.ps1 [-Check|-Fix] [-Home path]' }
        $homeOverride = [string]$args[++$i]
        continue
    }
    Fail "Unknown argument: $arg"
}
if ($help) { Write-Output 'Usage: doctor.ps1 [-Check|-Fix] [-Home path]'; exit 0 }
if ($check -and $fix) { Fail 'Choose either -Check or -Fix.' }

try {
    $repository = (Resolve-Path -LiteralPath (Split-Path -Parent $PSScriptRoot)).Path
    $homePath = if ($null -ne $homeOverride) { $homeOverride } else { $env:USERPROFILE }
    if ([string]::IsNullOrEmpty($homePath) -or -not (Test-Path -LiteralPath $homePath -PathType Container) -or (Is-Reparse $homePath)) { throw 'Home must be an existing real directory.' }
    $targetHome = (Resolve-Path -LiteralPath $homePath).Path
    $inventory = Join-Path $repository 'config/files.tsv'
    if (-not (Test-Path -LiteralPath $inventory -PathType Leaf) -or (Is-Reparse $inventory)) { throw "Missing or unsafe inventory: $inventory" }
    $items = Read-Inventory $inventory $repository $targetHome
    if ($fix) {
        $installer = Join-Path $repository 'install.ps1'
        $installerArguments = @('-Source', $repository, '-Home', $targetHome)
        & $installer @installerArguments
        if (-not $?) { throw 'Installer invocation failed.' }
    }
    $status = 0
    foreach ($item in $items) {
        if (-not (Test-Path -LiteralPath $item.Destination -PathType Leaf)) { Write-Output "missing: $($item.Destination)"; $status = 1; continue }
        $actual = [IO.File]::ReadAllBytes($item.Destination)
        if (EqualBytes $item.Expected $actual) { Write-Output "pass: $($item.Destination) matches canonical template" }
        else { Write-Output "drift: $($item.Destination) differs from canonical template"; $status = 1 }
    }
    exit $status
} catch { [Console]::Error.WriteLine($_.Exception.Message); exit 2 }
