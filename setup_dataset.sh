#!/bin/bash
# setup_dataset.sh - PlantVillage Dataset Preparation Script

echo "🍃 PlantVillage Dataset Setup"
echo "=============================="

DATASET_PATH="training/PlantVillage"

if [ ! -d "$DATASET_PATH" ]; then
    echo "❌ PlantVillage folder not found!"
    echo ""
    echo "📥 Please download the dataset first:"
    echo "   1. Go to: https://www.kaggle.com/datasets/arjuntejaswi/plant-village"
    echo "   2. Download the ZIP file"  
    echo "   3. Extract to get the PlantVillage folder"
    echo "   4. Move PlantVillage folder to: training/"
    echo "   5. Run this script again"
    echo ""
    read -p "Press Enter to exit"
    exit 1
fi

echo "📁 Found PlantVillage directory"

# Define potato-related folders to keep
POTATO_FOLDERS=("Potato___Early_blight" "Potato___healthy" "Potato___Late_blight")

echo "🔍 Scanning dataset folders..."
echo ""

folders_to_remove=()
folders_to_keep=()

# Scan all folders
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
            echo "✅ Will keep: $folder_name ($image_count images)"
            folders_to_keep+=("$folder")
        else
            echo "🗑️  Will remove: $folder_name"
            folders_to_remove+=("$folder")
        fi
    fi
done

if [ ${#folders_to_remove[@]} -eq 0 ]; then
    echo ""
    echo "🎉 Dataset is already clean! Only potato folders found."
else
    echo ""
    echo "⚠️  Found ${#folders_to_remove[@]} non-potato folders to remove."
    read -p "Do you want to proceed with cleanup? (y/N): " confirmation
    
    if [ "$confirmation" = "y" ] || [ "$confirmation" = "Y" ]; then
        echo ""
        echo "🧹 Cleaning up dataset..."
        
        for folder in "${folders_to_remove[@]}"; do
            folder_name=$(basename "$folder")
            echo "   Removing: $folder_name"
            rm -rf "$folder"
        done
        
        echo ""
        echo "🎉 Dataset cleanup complete!"
    else
        echo ""
        echo "❌ Cleanup cancelled."
        exit 0
    fi
fi

echo ""
echo "📊 Final dataset summary:"
echo "========================="

total_images=0
for folder in "${POTATO_FOLDERS[@]}"; do
    folder_path="$DATASET_PATH/$folder"
    if [ -d "$folder_path" ]; then
        image_count=$(find "$folder_path" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | wc -l)
        echo "   $folder: $image_count images"
        total_images=$((total_images + image_count))
    else
        echo "   $folder: NOT FOUND"
    fi
done

echo ""
echo "📈 Total Images: $total_images"
echo ""

if [ $total_images -gt 2000 ]; then
    echo "✅ Dataset looks good! You can now:"
    echo "   • Run the training notebook: training/potato-disease-classification-model.ipynb"
    echo "   • Start the API server: ./start-api.sh"
    echo "   • Start the web interface: ./start-ui.sh"
else
    echo "⚠️  Dataset seems incomplete. Expected ~2,152 images total."
    echo "   Please verify the download and extraction."
fi

echo ""
read -p "Press Enter to exit"
