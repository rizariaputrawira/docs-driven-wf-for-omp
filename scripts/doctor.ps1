[CmdletBinding()]
param(
    [switch]$Check,
    [switch]$Fix,
    [string]$Home
)
$ErrorActionPreference = 'Stop'
try {
    if ($Check -and $Fix) { throw 'Choose either -Check or -Fix.' }
    $mode = if ($Fix) { 'fix' } else { 'check' }
    $repository = Split-Path -Parent $PSScriptRoot
    $template = Join-Path $repository 'config/agent/AGENTS.md'
    if (-not (Test-Path -LiteralPath $template -PathType Leaf) -or (Get-Item -LiteralPath $template).Length -eq 0) {
        throw "Unusable source template: $template"
    }
    $homeDirectory = if ($Home) { $Home } else { $env:USERPROFILE }
    if (-not $homeDirectory -or -not (Test-Path -LiteralPath $homeDirectory -PathType Container)) {
        throw 'Home must name an existing directory.'
    }
    $destination = Join-Path $homeDirectory '.omp/agent/AGENTS.md'
    if ($mode -eq 'fix') {
        & (Join-Path $repository 'install.ps1') -Source $repository -Home $homeDirectory
        exit $LASTEXITCODE
    }
    if (-not (Test-Path -LiteralPath $destination -PathType Leaf)) {
        Write-Output "missing: $destination"
        exit 1
    }
    $expected = [IO.File]::ReadAllBytes($template)
    $actual = [IO.File]::ReadAllBytes($destination)
    if ($expected.Length -eq $actual.Length -and [Linq.Enumerable]::SequenceEqual[byte]($expected, $actual)) {
        Write-Output "pass: $destination matches canonical template"
        exit 0
    }
    Write-Output "drift: $destination differs from canonical template"
    exit 1
}
catch {
    [Console]::Error.WriteLine($_.Exception.Message)
    exit 2
}
