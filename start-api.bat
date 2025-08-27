@echo off
echo Starting Potato Disease API Server...
echo.

REM Activate virtual environment
call "%~dp0.venv\Scripts\activate.bat"

REM Check if virtual environment was activated
if errorlevel 1 (
    echo ERROR: Could not activate virtual environment
    echo Please ensure the virtual environment exists at %~dp0.venv
    pause
    exit /b 1
)

REM Install FastAPI and uvicorn if not already installed
echo Installing/updating required packages...
python -m pip install fastapi uvicorn[standard] python-multipart --quiet

REM Change to API directory and start server
cd /d "%~dp0api"
echo.
echo Starting FastAPI server on http://localhost:8000
echo Press Ctrl+C to stop the server
echo.

python main.py
