#!/bin/bash

# Potato Disease Classification System - Setup Script
# This script sets up the development environment on Unix-like systems

set -e  # Exit on any error

echo "🥔 Potato Disease Classification System - Setup"
echo "=============================================="

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8+ and try again."
    exit 1
fi

# Check Python version
python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
required_version="3.8"

if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then
    echo "❌ Python $python_version found, but Python $required_version+ is required."
    exit 1
fi

echo "✅ Python $python_version found"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 16+ and try again."
    exit 1
fi

node_version=$(node -v | cut -d'v' -f2)
echo "✅ Node.js $node_version found"

# Check if Git LFS is installed
if ! command -v git-lfs &> /dev/null; then
    echo "⚠️  Git LFS is not installed. Installing Git LFS..."
    
    # Try to install Git LFS based on the OS
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        if command -v apt-get &> /dev/null; then
            sudo apt-get update && sudo apt-get install git-lfs
        elif command -v yum &> /dev/null; then
            sudo yum install git-lfs
        else
            echo "❌ Please install Git LFS manually: https://git-lfs.github.io/"
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if command -v brew &> /dev/null; then
            brew install git-lfs
        else
            echo "❌ Please install Git LFS manually: https://git-lfs.github.io/"
            exit 1
        fi
    else
        echo "❌ Please install Git LFS manually: https://git-lfs.github.io/"
        exit 1
    fi
fi

echo "✅ Git LFS found"

# Initialize Git LFS
echo "📦 Initializing Git LFS..."
git lfs install
git lfs pull

# Create Python virtual environment
echo "🐍 Creating Python virtual environment..."
python3 -m venv .venv

# Activate virtual environment
echo "⚡ Activating virtual environment..."
source .venv/bin/activate

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install Python dependencies
echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

echo "✅ Backend setup complete!"

# Setup frontend
echo "🎨 Setting up React frontend..."
cd ui/potato-disease-frontend

# Install Node.js dependencies
echo "📦 Installing Node.js dependencies..."
npm install

echo "✅ Frontend setup complete!"

# Go back to root directory
cd ../..

echo ""
echo "🎉 Setup complete!"
echo ""
echo "To start the application:"
echo "1. Start the API server:"
echo "   source .venv/bin/activate && cd api && python main.py"
echo ""
echo "2. In a new terminal, start the frontend:"
echo "   cd ui/potato-disease-frontend && npm start"
echo ""
echo "3. Open your browser to http://localhost:3000"
echo ""
echo "📚 For more information, see the README.md file."
