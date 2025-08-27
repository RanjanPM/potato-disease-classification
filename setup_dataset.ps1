# setup_dataset.ps1 - PlantVillage Dataset Preparation Script

Write-Host "🍃 PlantVillage Dataset Setup" -ForegroundColor Green
Write-Host "=============================="

$datasetPath = "training\PlantVillage"

if (-not (Test-Path $datasetPath)) {
    Write-Host "❌ PlantVillage folder not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "📥 Please download the dataset first:" -ForegroundColor Yellow
    Write-Host "   1. Go to: https://www.kaggle.com/datasets/arjuntejaswi/plant-village" -ForegroundColor Cyan
    Write-Host "   2. Download the ZIP file" -ForegroundColor Cyan  
    Write-Host "   3. Extract to get the PlantVillage folder" -ForegroundColor Cyan
    Write-Host "   4. Move PlantVillage folder to: training\" -ForegroundColor Cyan
    Write-Host "   5. Run this script again" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "📁 Found PlantVillage directory" -ForegroundColor Green

# Define potato-related folders to keep
$potatoFolders = @(
    "Potato___Early_blight",
    "Potato___healthy", 
    "Potato___Late_blight"
)

# Get all directories in PlantVillage
$allFolders = Get-ChildItem -Path $datasetPath -Directory

Write-Host "🔍 Scanning dataset folders..." -ForegroundColor Blue
Write-Host ""

$foldersToRemove = @()
$foldersToKeep = @()

foreach ($folder in $allFolders) {
    if ($potatoFolders -contains $folder.Name) {
        $imageCount = (Get-ChildItem -Path $folder.FullName -File -Include "*.jpg", "*.jpeg", "*.png", "*.JPG", "*.JPEG", "*.PNG").Count
        Write-Host "✅ Will keep: $($folder.Name) ($imageCount images)" -ForegroundColor Green
        $foldersToKeep += $folder
    } else {
        Write-Host "🗑️  Will remove: $($folder.Name)" -ForegroundColor Yellow
        $foldersToRemove += $folder
    }
}

if ($foldersToRemove.Count -eq 0) {
    Write-Host ""
    Write-Host "🎉 Dataset is already clean! Only potato folders found." -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "⚠️  Found $($foldersToRemove.Count) non-potato folders to remove." -ForegroundColor Yellow
    $confirmation = Read-Host "Do you want to proceed with cleanup? (y/N)"
    
    if ($confirmation -eq 'y' -or $confirmation -eq 'Y') {
        Write-Host ""
        Write-Host "🧹 Cleaning up dataset..." -ForegroundColor Blue
        
        foreach ($folder in $foldersToRemove) {
            Write-Host "   Removing: $($folder.Name)" -ForegroundColor Gray
            Remove-Item -Path $folder.FullName -Recurse -Force
        }
        
        Write-Host ""
        Write-Host "🎉 Dataset cleanup complete!" -ForegroundColor Green
    } else {
        Write-Host ""
        Write-Host "❌ Cleanup cancelled." -ForegroundColor Yellow
        exit 0
    }
}

Write-Host ""
Write-Host "📊 Final dataset summary:" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan

$totalImages = 0
foreach ($folderName in $potatoFolders) {
    $folderPath = Join-Path $datasetPath $folderName
    if (Test-Path $folderPath) {
        $imageCount = (Get-ChildItem -Path $folderPath -File -Include "*.jpg", "*.jpeg", "*.png", "*.JPG", "*.JPEG", "*.PNG").Count
        Write-Host "   $folderName`: $imageCount images" -ForegroundColor White
        $totalImages += $imageCount
    } else {
        Write-Host "   $folderName`: NOT FOUND" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "📈 Total Images: $totalImages" -ForegroundColor Green
Write-Host ""

if ($totalImages -gt 2000) {
    Write-Host "✅ Dataset looks good! You can now:" -ForegroundColor Green
    Write-Host "   • Run the training notebook: training/potato-disease-classification-model.ipynb" -ForegroundColor Cyan
    Write-Host "   • Start the API server: .\start-api.ps1" -ForegroundColor Cyan
    Write-Host "   • Start the web interface: .\start-ui.ps1" -ForegroundColor Cyan
} else {
    Write-Host "⚠️  Dataset seems incomplete. Expected ~2,152 images total." -ForegroundColor Yellow
    Write-Host "   Please verify the download and extraction." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Press Enter to exit"
