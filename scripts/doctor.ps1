$ErrorActionPreference = 'Stop'

function Fail([string]$Message) { [Console]::Error.WriteLine($Message); exit 2 }
. (Join-Path $PSScriptRoot 'validate-inventory.ps1')
. (Join-Path $PSScriptRoot 'telemetry-profiles.ps1')


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
    $profiles = @(Get-TelemetryProfilePlan $targetHome)
    if ($fix) {
        $installer = Join-Path $repository 'install.ps1'
        $installerArguments = @('-Source', $repository, '-Home', $targetHome)
        & $installer @installerArguments
        if (-not $?) { throw 'Installer invocation failed.' }
        $profiles = @(Get-TelemetryProfilePlan $targetHome)
    }
    $status = 0
    foreach ($profile in $profiles) {
        if ($profile.Present) { Write-Output "pass telemetry profile stanza: $($profile.Path)" }
        else { Write-Output "missing telemetry profile stanza: $($profile.Path)"; $status = 1 }
    }
    foreach ($item in $items) {
        if (-not (Test-Path -LiteralPath $item.Destination -PathType Leaf)) { Write-Output "missing: $($item.Destination)"; $status = 1; continue }
        $actual = [IO.File]::ReadAllBytes($item.Destination)
        if (EqualBytes $item.Bytes $actual) { Write-Output "pass: $($item.Destination) matches canonical template" }
        else { Write-Output "drift: $($item.Destination) differs from canonical template"; $status = 1 }
    }
    if ($status -eq 0) { Write-Output 'managed summary: healthy' } else { Write-Output 'managed summary: errors found' }
    try {
    $observed = $false
    foreach ($base in @('.agent', '.agents')) {
        $parent = Join-Path $targetHome $base
        $root = Join-Path $parent 'skills'
        if (Is-Reparse $parent) {
            Write-Output "advisory: LEGACY skill root parent is a reparse point, not traversed: $parent"; $observed = $true
        } elseif (Is-Reparse $root) {
            Write-Output "advisory: LEGACY skill root is a reparse point, not traversed: $root"; $observed = $true
        } elseif (Test-Path -LiteralPath $root -PathType Container) {
            Write-Output "advisory: LEGACY skill root present: $root"; $observed = $true
            foreach ($entry in [IO.Directory]::GetFileSystemEntries($root)) {
                if (Is-Reparse $entry) { Write-Output "advisory: LEGACY reparse entry not traversed: $entry" }
                else { Write-Output "advisory: LEGACY skill root entry: $entry" }
            }
        }
    }
    $ompRoot = Join-Path $targetHome '.omp'
    $native = Join-Path $ompRoot 'agent'
    if (Is-Reparse $ompRoot) {
        Write-Output "advisory: UNMANAGED native root is a reparse point, not traversed: $ompRoot"; $observed = $true
    } elseif (Is-Reparse $native) {
        Write-Output "advisory: UNMANAGED native agent root is a reparse point, not traversed: $native"; $observed = $true
    } elseif (Test-Path -LiteralPath $native -PathType Container) {
        foreach ($entry in [IO.Directory]::GetFileSystemEntries($native)) {
            if (Is-Reparse $entry) { continue }
            $name = [IO.Path]::GetFileName($entry)
            if ($name -eq 'skills') { continue }
            $exact = Join-Path $native $name
            $prefix = $exact.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
            $managed = $false
            foreach ($item in $items) {
                if ([string]::Equals($item.Destination, $exact, [StringComparison]::OrdinalIgnoreCase) -or $item.Destination.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { $managed = $true; break }
            }
            if (-not $managed) { Write-Output "advisory: UNMANAGED native entry: $entry"; $observed = $true }
        }
        $skills = Join-Path $native 'skills'
        if (Is-Reparse $skills) {
            Write-Output "advisory: UNMANAGED native skills root is a reparse point, not traversed: $skills"; $observed = $true
        } elseif (Test-Path -LiteralPath $skills -PathType Container) {
            $retired = [IO.File]::ReadAllLines((Join-Path $PSScriptRoot 'retired-skills.txt'))
            foreach ($entry in [IO.Directory]::GetFileSystemEntries($skills)) {
                if (Is-Reparse $entry) { continue }
                $name = [IO.Path]::GetFileName($entry)
                if ($retired -ccontains $name) { Write-Output "advisory: LEGACY retired skill: $entry"; $observed = $true }
                else {
                    $prefix = $entry.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
                    $managed = $false
                    foreach ($item in $items) {
                        if ($item.Destination.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { $managed = $true; break }
                    }
                    if (-not $managed) { Write-Output "advisory: UNMANAGED native skill: $entry"; $observed = $true }
                }
            }
        }
    }
    if (-not $observed) { Write-Output 'advisory summary: no unmanaged observations' }
    } catch {
        Write-Output "advisory: WARN observation unavailable: $($_.Exception.Message)"
    }
    exit $status
} catch { Write-Output 'managed summary: errors found'; [Console]::Error.WriteLine($_.Exception.Message); exit 2 }
