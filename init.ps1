# Support Agents Init Script for Windows
# Sets up OpenCode configuration

$ErrorActionPreference = "Stop"

Write-Host "Setting up Support Agents..." -ForegroundColor Cyan

# Determine the script's directory (where support-agents is cloned)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $ScriptDir) {
    $ScriptDir = $PWD.Path
}

# OpenCode config directory on Windows
$OpenCodeConfig = Join-Path $env:APPDATA "opencode"

Write-Host "Configuring OpenCode..." -ForegroundColor Cyan

# Create OpenCode config directories
$Directories = @("agent", "command", "themes")
foreach ($Dir in $Directories) {
    $TargetDir = Join-Path $OpenCodeConfig $Dir
    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
        Write-Host "  Created: $TargetDir" -ForegroundColor Gray
    }
}

# Copy assets (only if source is newer or destination doesn't exist)
function Copy-IfNewer {
    param (
        [string]$SourceDir,
        [string]$DestDir
    )
    
    $SourceFiles = Get-ChildItem -Path $SourceDir -File -ErrorAction SilentlyContinue
    foreach ($File in $SourceFiles) {
        $DestFile = Join-Path $DestDir $File.Name
        $ShouldCopy = $false
        
        if (-not (Test-Path $DestFile)) {
            $ShouldCopy = $true
        } else {
            $DestLastWrite = (Get-Item $DestFile).LastWriteTime
            if ($File.LastWriteTime -gt $DestLastWrite) {
                $ShouldCopy = $true
            }
        }
        
        if ($ShouldCopy) {
            Copy-Item -Path $File.FullName -Destination $DestFile -Force
            Write-Host "  Copied: $($File.Name)" -ForegroundColor Gray
        }
    }
}

$AssetsDir = Join-Path $ScriptDir "OPENCODE_ASSETS"

Copy-IfNewer -SourceDir (Join-Path $AssetsDir "agent") -DestDir (Join-Path $OpenCodeConfig "agent")
Copy-IfNewer -SourceDir (Join-Path $AssetsDir "command") -DestDir (Join-Path $OpenCodeConfig "command")
Copy-IfNewer -SourceDir (Join-Path $AssetsDir "themes") -DestDir (Join-Path $OpenCodeConfig "themes")

Write-Host ""
Write-Host "Done! OpenCode assets installed to: $OpenCodeConfig" -ForegroundColor Green
Write-Host ""
Write-Host "Available commands:" -ForegroundColor Yellow
Write-Host "  /drizzle      - Get info about Drizzle ORM"
Write-Host "  /effect       - Get info about Effect.ts"
Write-Host "  /svelte       - Get info about Svelte"
Write-Host "  /opencode     - Get info about OpenCode"
Write-Host "  /docs-update  - Update library subtrees"
Write-Host ""
Write-Host "Available agents:" -ForegroundColor Yellow
Write-Host "  docs-support-agent - Expert agent for library documentation"
Write-Host ""
