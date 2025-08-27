Write-Host "Starting Potato Disease API Server..." -ForegroundColor Green
Write-Host ""

# Get the script directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Activate virtual environment
$venvPath = Join-Path $scriptDir ".venv\Scripts\Activate.ps1"
if (Test-Path $venvPath) {
    Write-Host "Activating virtual environment..." -ForegroundColor Yellow
    & $venvPath
} else {
    Write-Host "ERROR: Virtual environment not found at $venvPath" -ForegroundColor Red
    Write-Host "Please run the setup first to create the virtual environment" -ForegroundColor Red
    exit 1
}

# Install required packages
Write-Host "Installing/updating required packages..." -ForegroundColor Yellow
python -m pip install fastapi uvicorn[standard] python-multipart --quiet

# Change to API directory
$apiDir = Join-Path $scriptDir "api"
Set-Location $apiDir

Write-Host ""
Write-Host "Starting FastAPI server on http://localhost:8000" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Start the server
python main.py
