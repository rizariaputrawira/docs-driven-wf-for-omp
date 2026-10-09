# Shared inventory validation completes before installer or doctor writes.
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
