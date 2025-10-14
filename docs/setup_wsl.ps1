<#
PowerShell helper to enable WSL (WSL2) and then launch WSL.
Run as Administrator.
#>

If (-not ([bool](Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux).State -eq 'Enabled')) {
    Write-Host "Enabling WSL feature... (requires restart)" -ForegroundColor Yellow
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart | Out-Null
    Write-Host "WSL feature enabled. Please restart your machine and run this script again to finish installation." -ForegroundColor Green
    Exit 0
} else {
    Write-Host "WSL is already enabled. Proceeding to install default distribution via 'wsl --install' if available..." -ForegroundColor Green
}

# Try to install default distro (requires Windows 10/11 with wsl --install support)
try {
    Write-Host "Attempting 'wsl --install' to ensure a distro is installed..." -ForegroundColor Cyan
    wsl --install
} catch {
    Write-Host "Note: 'wsl --install' may require elevated Windows 10/11 and specific Windows builds. If it fails, install a distro from the Microsoft Store." -ForegroundColor Yellow
}

Write-Host "Launching WSL shell..." -ForegroundColor Green
wsl

# Offer to install Visual Studio Build Tools (useful for native npm builds)
function Install-BuildToolsViaWinget {
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        $consent = Read-Host "winget is available. Install Visual Studio 2022 Build Tools (C++ workload)? (Y/N)"
        if ($consent -match '^[Yy]') {
            Write-Host "Installing Visual Studio Build Tools via winget (this may take a while)..." -ForegroundColor Cyan
            try {
                winget install --id Microsoft.VisualStudio.2022.BuildTools -e --accept-package-agreements --accept-source-agreements
                Write-Host "Build Tools install command completed. You may need to restart and re-open PowerShell/VS Code." -ForegroundColor Green
            } catch {
                Write-Host "winget installation failed or was cancelled. You can install Build Tools manually from https://visualstudio.microsoft.com/downloads/" -ForegroundColor Yellow
            }
        } else {
            Write-Host "Skipping Build Tools installation." -ForegroundColor Yellow
        }
    } else {
        Write-Host "winget not found. To install Build Tools manually, use: https://visualstudio.microsoft.com/downloads/" -ForegroundColor Yellow
    }
}

# Prompt user about Build Tools only if running elevated (to avoid surprises)
if (([Security.Principal.WindowsIdentity]::GetCurrent()).Groups -match "S-1-5-32-544") {
    $installBT = Read-Host "Would you like to install Visual Studio Build Tools now? (recommended for native builds) (Y/N)"
    if ($installBT -match '^[Yy]') { Install-BuildToolsViaWinget }
}
