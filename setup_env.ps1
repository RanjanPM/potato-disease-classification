# Potato Disease Project - Deeplearning Environment Setup
$env:DEEPLEARNING_PYTHON = "C:\Users\pmidde\AppData\Local\anaconda3\envs\deeplearning\python.exe"
$env:DEEPLEARNING_JUPYTER = "C:\Users\pmidde\AppData\Local\anaconda3\envs\deeplearning\Scripts\jupyter-notebook.exe"
$env:DEEPLEARNING_PIP = "C:\Users\pmidde\AppData\Local\anaconda3\envs\deeplearning\Scripts\pip.exe"

Write-Host "🚀 Deeplearning environment activated for potato-disease project!" -ForegroundColor Green
Write-Host ""
Write-Host "Available commands:" -ForegroundColor Yellow
Write-Host "  Python:  & `$env:DEEPLEARNING_PYTHON" -ForegroundColor Cyan
Write-Host "  Jupyter: & `$env:DEEPLEARNING_JUPYTER" -ForegroundColor Cyan  
Write-Host "  Pip:     & `$env:DEEPLEARNING_PIP" -ForegroundColor Cyan
Write-Host ""
Write-Host "Quick shortcuts:" -ForegroundColor Yellow
Write-Host "  Start Jupyter: & `$env:DEEPLEARNING_JUPYTER" -ForegroundColor Magenta
Write-Host "  Run Python:    & `$env:DEEPLEARNING_PYTHON your_script.py" -ForegroundColor Magenta
Write-Host ""

# Test TensorFlow
Write-Host "Testing TensorFlow..." -ForegroundColor Yellow
& $env:DEEPLEARNING_PYTHON -c "import tensorflow as tf; print(\"✅ TensorFlow\", tf.__version__, \"ready!\")"
Write-Host "🎯 Ready for deep learning development!" -ForegroundColor Green
