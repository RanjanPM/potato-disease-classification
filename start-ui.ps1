Write-Host "Starting Potato Disease Frontend..." -ForegroundColor Green
Write-Host ""

# Get script directory and navigate to UI folder
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$uiDir = Join-Path $scriptDir "ui\potato-disease-frontend"

Set-Location $uiDir

# Check if node_modules exists
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing dependencies..." -ForegroundColor Yellow
    npm install
}

Write-Host ""
Write-Host "Starting React development server on http://localhost:3000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

npm start
