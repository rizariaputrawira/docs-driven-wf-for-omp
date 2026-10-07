# Shared profile planning keeps install validation ahead of all destination writes.
function Get-TelemetryProfilePlan([string]$TargetHome) {
    $marker = '# >>> omp telemetry opt-out >>>'
    $endMarker = '# <<< omp telemetry opt-out <<<'
    $sourceLine = 'if (Test-Path -LiteralPath "$HOME/.omp/telemetry.ps1") { . "$HOME/.omp/telemetry.ps1" }'
    $pattern = '(?m)^' + [regex]::Escape($marker) + '\r?\n' + [regex]::Escape($sourceLine) + '\r?\n' + [regex]::Escape($endMarker) + '\r?$'
    foreach ($relative in @(
        'Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1',
        'Documents/WindowsPowerShell/profile.ps1',
        'Documents/PowerShell/Microsoft.PowerShell_profile.ps1',
        'Documents/PowerShell/profile.ps1'
    )) {
        $profile = Join-Path $TargetHome $relative
        $walk = $profile
        while ($walk -ne $TargetHome) {
            try { $entry = Get-Item -LiteralPath $walk -Force -ErrorAction Stop }
            catch [System.Management.Automation.ItemNotFoundException] { $entry = $null }
            if ($null -ne $entry) {
                if (($entry.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "Unsafe PowerShell profile path: $walk" }
                if ($walk -ne $profile -and -not $entry.PSIsContainer) { throw "Unsafe PowerShell profile parent: $walk" }
                if ($walk -eq $profile -and $entry.PSIsContainer) { throw "Unsafe PowerShell profile: $profile" }
            }
            $walk = Split-Path -Parent $walk
            if ([string]::IsNullOrEmpty($walk)) { throw "Profile escapes selected home: $profile" }
        }
        $bytes = [byte[]]@()
        if (Test-Path -LiteralPath $profile) { $bytes = [IO.File]::ReadAllBytes($profile) }
        $encoding = [Text.UTF8Encoding]::new($false)
        if ($bytes.Length -ge 4 -and $bytes[0] -eq 255 -and $bytes[1] -eq 254 -and $bytes[2] -eq 0 -and $bytes[3] -eq 0) {
            $encoding = [Text.Encoding]::GetEncoding(12000)
        } elseif ($bytes.Length -ge 4 -and $bytes[0] -eq 0 -and $bytes[1] -eq 0 -and $bytes[2] -eq 254 -and $bytes[3] -eq 255) {
            $encoding = [Text.Encoding]::GetEncoding(12001)
        } elseif ($bytes.Length -ge 2 -and $bytes[0] -eq 255 -and $bytes[1] -eq 254) {
            $encoding = [Text.Encoding]::Unicode
        } elseif ($bytes.Length -ge 2 -and $bytes[0] -eq 254 -and $bytes[1] -eq 255) {
            $encoding = [Text.Encoding]::BigEndianUnicode
        }
        $text = $encoding.GetString($bytes)
        $openCount = [regex]::Matches($text, '(?m)^' + [regex]::Escape($marker) + '\r?$').Count
        $closeCount = [regex]::Matches($text, '(?m)^' + [regex]::Escape($endMarker) + '\r?$').Count
        if ($openCount -ne $closeCount -or $openCount -gt 1 -or ($openCount -eq 1 -and -not [regex]::IsMatch($text, $pattern))) {
            throw "Invalid managed PowerShell profile stanza: $profile"
        }
        if ($openCount -eq 1) {
            $match = [regex]::Match($text, $pattern)
            $tail = $text.Substring($match.Index + $match.Length)
            if ([regex]::IsMatch($tail, '(?m)^[\t ]*[^#\s]')) { throw "Managed PowerShell stanza must be at the end of the profile: $profile" }
        }
        [pscustomobject]@{
            Path = $profile
            Present = ($openCount -eq 1)
            Encoding = $encoding
            Stanza = "`r`n$marker`r`n$sourceLine`r`n$endMarker`r`n"
        }
    }
}

function Install-TelemetryProfiles($Profiles, [bool]$DryRun) {
    foreach ($profile in $Profiles) {
        if ($profile.Present) { continue }
        if ($DryRun) { Write-Output "would update PowerShell profile: $($profile.Path)"; continue }
        $directory = Split-Path -Parent $profile.Path
        if (-not (Test-Path -LiteralPath $directory)) { [void](New-Item -ItemType Directory -Path $directory -Force) }
        if (Test-Path -LiteralPath $profile.Path) {
            $backup = "$($profile.Path).bak.$([DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ'))"
            $candidate = $backup; $suffix = 0
            while ($null -ne (Get-Item -LiteralPath $candidate -Force -ErrorAction SilentlyContinue)) { $suffix++; $candidate = "$backup.$suffix" }
            [IO.File]::Copy($profile.Path, $candidate)
            Write-Output "backup: $candidate"
        }
        # Append bytes in the existing BOM-selected encoding, without a second BOM.
        $stream = [IO.File]::Open($profile.Path, [IO.FileMode]::Append, [IO.FileAccess]::Write)
        try {
            $append = $profile.Encoding.GetBytes($profile.Stanza)
            $stream.Write($append, 0, $append.Length)
        } finally { $stream.Dispose() }
        Write-Output "updated PowerShell profile: $($profile.Path)"
    }
}
