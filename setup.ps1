# Potato Disease Classification System - Windows Setup Script

Write-Host "🥔 Potato Disease Classification System - Setup" -ForegroundColor Green
Write-Host "=============================================="

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    if ($pythonVersion -match "Python (\d+\.\d+)") {
        $version = [version]$matches[1]
        $requiredVersion = [version]"3.8"
        
        if ($version -ge $requiredVersion) {
            Write-Host "✅ $pythonVersion found" -ForegroundColor Green
        } else {
            Write-Host "❌ $pythonVersion found, but Python 3.8+ is required." -ForegroundColor Red
            exit 1
        }
    }
} catch {
    Write-Host "❌ Python is not installed. Please install Python 3.8+ and try again." -ForegroundColor Red
    exit 1
}

# Check if Node.js is installed
try {
    $nodeVersion = node --version 2>&1
    Write-Host "✅ Node.js $nodeVersion found" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js is not installed. Please install Node.js 16+ and try again." -ForegroundColor Red
    exit 1
}

# Check if Git LFS is installed
try {
    git lfs version | Out-Null
    Write-Host "✅ Git LFS found" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Git LFS is not installed. Please install Git LFS from: https://git-lfs.github.io/" -ForegroundColor Yellow
    Write-Host "After installing Git LFS, run this script again." -ForegroundColor Yellow
    exit 1
}

# Initialize Git LFS
Write-Host "📦 Initializing Git LFS..." -ForegroundColor Blue
git lfs install
git lfs pull

# Create Python virtual environment
Write-Host "🐍 Creating Python virtual environment..." -ForegroundColor Blue
python -m venv .venv

# Activate virtual environment
Write-Host "⚡ Activating virtual environment..." -ForegroundColor Blue
& .\.venv\Scripts\Activate.ps1

# Upgrade pip
Write-Host "⬆️  Upgrading pip..." -ForegroundColor Blue
python -m pip install --upgrade pip

# Install Python dependencies
Write-Host "📦 Installing Python dependencies..." -ForegroundColor Blue
pip install -r requirements.txt

Write-Host "✅ Backend setup complete!" -ForegroundColor Green

# Setup frontend
Write-Host "🎨 Setting up React frontend..." -ForegroundColor Blue
Set-Location ui/potato-disease-frontend

# Install Node.js dependencies
Write-Host "📦 Installing Node.js dependencies..." -ForegroundColor Blue
npm install

Write-Host "✅ Frontend setup complete!" -ForegroundColor Green

# Go back to root directory
Set-Location ../..

Write-Host ""
Write-Host "🎉 Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "To start the application:" -ForegroundColor Cyan
Write-Host "1. Start the API server:" -ForegroundColor White
Write-Host "   .\start-api.ps1" -ForegroundColor Yellow
Write-Host ""
Write-Host "2. In a new terminal, start the frontend:" -ForegroundColor White
Write-Host "   .\start-ui.ps1" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Open your browser to http://localhost:3000" -ForegroundColor White
Write-Host ""
Write-Host "📚 For more information, see the README.md file." -ForegroundColor Cyan
