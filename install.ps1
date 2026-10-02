[CmdletBinding()]
param(
    [switch]$DryRun,
    [string]$Source,
    [string]$Home
)
$ErrorActionPreference = 'Stop'

$tempRoot = $null
try {
    if (-not $Source) { $Source = $PSScriptRoot }
    if ($Source -match '^https?://') {
        $tempRoot = Join-Path ([IO.Path]::GetTempPath()) ([guid]::NewGuid().ToString())
        New-Item -ItemType Directory -Path $tempRoot | Out-Null
        $archive = Join-Path $tempRoot 'source.zip'
        Invoke-WebRequest -Uri $Source -OutFile $archive
        Expand-Archive -LiteralPath $archive -DestinationPath (Join-Path $tempRoot 'expanded')
        $roots = @(Get-ChildItem -LiteralPath (Join-Path $tempRoot 'expanded') -Directory)
        if ($roots.Count -ne 1) { throw 'Archive must contain exactly one root directory.' }
        $Source = $roots[0].FullName
    }
    $template = Join-Path $Source 'config/agent/AGENTS.md'
    if (-not (Test-Path -LiteralPath $template -PathType Leaf)) { throw "Missing template: $template" }
    $content = [IO.File]::ReadAllBytes($template)
    if ($content.Length -eq 0) { throw 'Template is empty.' }
    $homeDirectory = if ($Home) { $Home } else { $env:USERPROFILE }
    if (-not $homeDirectory) { throw 'Home directory is not set.' }
    $destination = Join-Path $homeDirectory '.omp/agent/AGENTS.md'
    if ((Test-Path -LiteralPath $destination -PathType Leaf) -and
        [Convert]::ToBase64String($content) -ceq [Convert]::ToBase64String([IO.File]::ReadAllBytes($destination))) {
        Write-Output "unchanged: $destination"
        exit 0
    }
    if ($DryRun) { Write-Output "would install: $destination"; exit 0 }
    $directory = Split-Path -Parent $destination
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
    if (Test-Path -LiteralPath $destination) {
        $stamp = [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ')
        $backup = "$destination.bak.$stamp"
        $suffix = 0
        while (Test-Path -LiteralPath $backup) { $suffix++; $backup = "$destination.bak.$stamp.$suffix" }
        Copy-Item -LiteralPath $destination -Destination $backup
        Write-Output "backup: $backup"
    }
    [IO.File]::WriteAllBytes($destination, $content)
    Write-Output "installed: $destination"
}
finally {
    if ($tempRoot -and (Test-Path -LiteralPath $tempRoot)) { Remove-Item -LiteralPath $tempRoot -Recurse -Force }
}
