@echo off
echo Starting Potato Disease Frontend...
echo.

REM Change to UI directory
cd /d "%~dp0ui\potato-disease-frontend"

REM Check if node_modules exists
if not exist "node_modules" (
    echo Installing dependencies...
    npm install
)

echo.
echo Starting React development server on http://localhost:3000
echo Press Ctrl+C to stop the server
echo.

npm start
