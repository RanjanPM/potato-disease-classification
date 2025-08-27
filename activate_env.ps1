Write-Host "Activating deeplearning environment for potato-disease project..." -ForegroundColor Green
& "C:\Users\pmidde\AppData\Local\anaconda3\Scripts\conda.exe" activate deeplearning
if ($LASTEXITCODE -eq 0) {
    Write-Host "Environment activated! TensorFlow is now available." -ForegroundColor Green
} else {
    Write-Host "Fallback: Using direct Python path for deeplearning environment" -ForegroundColor Yellow
    $env:PYTHON_PATH = "C:\Users\pmidde\AppData\Local\anaconda3\envs\deeplearning\python.exe"
    Write-Host "Use: & $env:PYTHON_PATH for Python commands" -ForegroundColor Yellow
}
