# 📊 Dataset Setup Instructions

## PlantVillage Dataset

This project uses the **PlantVillage Dataset** for training the potato disease classification model. The dataset contains images of plant leaves with various diseases.

### 🔗 Dataset Source
- **Kaggle Dataset**: [Plant Village Dataset](https://www.kaggle.com/datasets/arjuntejaswi/plant-village?resource=download)
- **Original Paper**: Hughes, D. P., & Salathé, M. (2015). An open access repository of images on plant health to enable the development of mobile disease diagnostics.

## 📥 Download Instructions

### Option 1: Manual Download (Recommended)

1. **Visit the Kaggle dataset page**: https://www.kaggle.com/datasets/arjuntejaswi/plant-village?resource=download

2. **Sign in to Kaggle** (create account if needed)

3. **Download the dataset** by clicking the "Download" button

4. **Extract the ZIP file** to get the `PlantVillage` folder

5. **Copy only potato-related folders** to your project:
   ```
   training/
   └── PlantVillage/
       ├── Potato___Early_blight/     # Keep this folder
       ├── Potato___healthy/          # Keep this folder
       ├── Potato___Late_blight/      # Keep this folder
       └── [Delete all other crop folders]
   ```

### Option 2: Using Kaggle CLI

If you have Kaggle CLI installed:

```bash
# Install Kaggle CLI
pip install kaggle

# Configure API credentials (see Kaggle API documentation)
# Download dataset
kaggle datasets download -d arjuntejaswi/plant-village

# Extract
unzip plant-village.zip
```

## 🗂️ Dataset Organization

After downloading, your directory structure should look like:

```
training/
└── PlantVillage/
    ├── Potato___Early_blight/          # ~1,000 images
    │   ├── 001187a0-57ab-4329-baff-e7246a9edeb0___RS_Early.B 8178.JPG
    │   ├── 002a55fb-7a3d-4a3a-aca8-ce2d5ebc6925___RS_Early.B 8170.JPG
    │   └── ... (more images)
    ├── Potato___healthy/               # ~152 images  
    │   ├── 0a5e9323-dbad-432d-ac58-d291718345d9___RS_HL 1808.JPG
    │   └── ... (more images)
    └── Potato___Late_blight/           # ~1,000 images
        ├── 0a0ccaab-6f0c-426c-8d12-c41c5e4b1d3f___RS_LB 4440.JPG
        └── ... (more images)
```

## 🧹 Cleanup Script

### Windows PowerShell Script

Create this script as `setup_dataset.ps1`:

```powershell
# setup_dataset.ps1 - Dataset preparation script

Write-Host "🍃 PlantVillage Dataset Setup" -ForegroundColor Green
Write-Host "=============================="

$datasetPath = "training\PlantVillage"

if (-not (Test-Path $datasetPath)) {
    Write-Host "❌ PlantVillage folder not found!" -ForegroundColor Red
    Write-Host "Please download from: https://www.kaggle.com/datasets/arjuntejaswi/plant-village" -ForegroundColor Yellow
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

foreach ($folder in $allFolders) {
    if ($potatoFolders -contains $folder.Name) {
        $imageCount = (Get-ChildItem -Path $folder.FullName -File).Count
        Write-Host "✅ Keeping: $($folder.Name) ($imageCount images)" -ForegroundColor Green
    } else {
        Write-Host "🗑️  Removing: $($folder.Name)" -ForegroundColor Yellow
        Remove-Item -Path $folder.FullName -Recurse -Force
    }
}

Write-Host ""
Write-Host "🎉 Dataset cleanup complete!" -ForegroundColor Green
Write-Host "📊 Final dataset summary:" -ForegroundColor Cyan

foreach ($folder in $potatoFolders) {
    $folderPath = Join-Path $datasetPath $folder
    if (Test-Path $folderPath) {
        $imageCount = (Get-ChildItem -Path $folderPath -File).Count
        Write-Host "   $folder`: $imageCount images" -ForegroundColor White
    }
}
```

### Linux/macOS Script

Create this script as `setup_dataset.sh`:

```bash
#!/bin/bash
# setup_dataset.sh - Dataset preparation script

echo "🍃 PlantVillage Dataset Setup"
echo "=============================="

DATASET_PATH="training/PlantVillage"

if [ ! -d "$DATASET_PATH" ]; then
    echo "❌ PlantVillage folder not found!"
    echo "Please download from: https://www.kaggle.com/datasets/arjuntejaswi/plant-village"
    exit 1
fi

echo "📁 Found PlantVillage directory"

# Define potato-related folders to keep
POTATO_FOLDERS=("Potato___Early_blight" "Potato___healthy" "Potato___Late_blight")

echo "🔍 Scanning dataset folders..."

# Remove non-potato folders
for folder in "$DATASET_PATH"/*; do
    if [ -d "$folder" ]; then
        folder_name=$(basename "$folder")
        
        # Check if this folder should be kept
        keep_folder=false
        for potato_folder in "${POTATO_FOLDERS[@]}"; do
            if [ "$folder_name" = "$potato_folder" ]; then
                keep_folder=true
                break
            fi
        done
        
        if [ "$keep_folder" = true ]; then
            image_count=$(find "$folder" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | wc -l)
            echo "✅ Keeping: $folder_name ($image_count images)"
        else
            echo "🗑️  Removing: $folder_name"
            rm -rf "$folder"
        fi
    fi
done

echo ""
echo "🎉 Dataset cleanup complete!"
echo "📊 Final dataset summary:"

for folder in "${POTATO_FOLDERS[@]}"; do
    folder_path="$DATASET_PATH/$folder"
    if [ -d "$folder_path" ]; then
        image_count=$(find "$folder_path" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | wc -l)
        echo "   $folder: $image_count images"
    fi
done
```

## 📊 Expected Dataset Statistics

After cleanup, you should have approximately:

| Class | Number of Images | Description |
|-------|-----------------|-------------|
| **Potato___Early_blight** | ~1,000 | Dark spots with concentric rings |
| **Potato___healthy** | ~152 | Clean, green leaves |
| **Potato___Late_blight** | ~1,000 | Water-soaked lesions with fuzzy growth |
| **Total** | **~2,152** | **All potato classes** |

## 🔧 Automated Setup

Run the setup script after downloading:

### Windows:
```powershell
.\setup_dataset.ps1
```

### Linux/macOS:
```bash
chmod +x setup_dataset.sh
./setup_dataset.sh
```

## ⚠️ Important Notes

1. **Dataset Size**: The complete PlantVillage dataset is ~500MB. After filtering to potato classes only, it's ~40MB.

2. **Image Formats**: All images are in JPG format with varying resolutions.

3. **Licensing**: The dataset is available under Creative Commons license. Please cite the original paper if using for research.

4. **Git LFS**: Individual image files are tracked with Git LFS in this repository, but we recommend downloading fresh for training.

## 🚀 Next Steps

After setting up the dataset:

1. **Verify setup** by running the training notebook
2. **Explore the data** using the visualization cells
3. **Train your model** or use the pre-trained model
4. **Test with new images** using the web interface

## 📚 Citation

If you use this dataset in your research, please cite:

```bibtex
@article{hughes2015open,
  title={An open access repository of images on plant health to enable the development of mobile disease diagnostics},
  author={Hughes, David P and Salath{\'e}, Marcel},
  journal={arXiv preprint arXiv:1511.08060},
  year={2015}
}
```
