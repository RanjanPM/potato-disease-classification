# 🥔 Potato Disease Classification System

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![React](https://img.shields.io/badge/React-18.0+-61DAFB.svg)](https://reactjs.org/)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-2.15+-FF6F00.svg)](https://tensorflow.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.104+-009688.svg)](https://fastapi.tiangolo.com/)

A complete **AI-powered web application** for detecting potato leaf diseases using **Deep Learning**. This system combines a **FastAPI backend** with **TensorFlow/Keras** for ML predictions and a modern **React TypeScript frontend** for an intuitive user experience.

## 🎯 Live Demo

🌐 **[Try the Live Demo](http://your-demo-url.com)** *(Coming Soon)*

## ✨ Key Features

- 🔬 **AI Disease Detection**: 95%+ accuracy in identifying potato diseases
- 📱 **Modern Web Interface**: Drag-and-drop image upload with real-time results
- ⚡ **Fast API**: RESTful API with automatic OpenAPI documentation
- 🎨 **Professional UI**: Responsive design with smooth animations
- 📊 **Confidence Scoring**: Visual confidence indicators for predictions
- 🌱 **Agricultural Insights**: Disease descriptions and treatment recommendations

## 🖼️ Screenshots

### Main Interface
![Main Interface](docs/images/main-interface.png)
*Drag-and-drop image upload interface*

### Prediction Results
![Prediction Results](docs/images/prediction-results.png)
*Real-time disease classification with confidence scoring*

### API Documentation
![API Docs](docs/images/api-docs.png)
*Automatic FastAPI documentation at `/docs`*

## 🏗️ Project Structure

```
potato-disease/
├── 📁 api/                          # FastAPI backend
│   └── main.py                      # API server with ML model
├── 📁 ui/                           # React frontend
│   └── potato-disease-frontend/     # React TypeScript app
├── 📁 training/                     # ML model training
│   ├── potato-disease-classification-model.ipynb  # Comprehensive training notebook
│   └── PlantVillage/               # Training dataset (download required)
│       ├── Potato___Early_blight/  # ~1,000 images of early blight disease
│       ├── Potato___healthy/       # ~152 images of healthy potato leaves  
│       └── Potato___Late_blight/   # ~1,000 images of late blight disease
├── 📁 saved_models/                 # Trained ML models
│   └── 1_potatos.h5                # TensorFlow model (2.18 MB)
├── 📁 docs/                         # Documentation and images
├── .venv/                          # Python virtual environment
├── requirements.txt                # Python dependencies
├── .gitignore                      # Git ignore rules
├── .gitattributes                  # Git LFS configuration
├── LICENSE                         # MIT License
├── CONTRIBUTING.md                 # Contribution guidelines
├── DATASET_SETUP.md                # Dataset download instructions
├── setup_dataset.ps1               # Windows dataset cleanup script
├── setup_dataset.sh                # Unix dataset cleanup script
├── start-api.bat/.ps1              # Windows scripts to start API
├── start-ui.bat/.ps1               # Windows scripts to start UI
└── README.md                       # This file
```

## 🚀 Quick Start

### Prerequisites
- 🐍 **Python 3.8+** 
- 📦 **Node.js 16+**
- 🔧 **Git** and **Git LFS** (for large files)
- 💾 **4GB+ RAM** (for model inference)

### � Dataset Setup (Required for Training)

**Important**: If you want to train the model yourself, you need to download the PlantVillage dataset:

1. **Download dataset**: Go to [Kaggle PlantVillage Dataset](https://www.kaggle.com/datasets/arjuntejaswi/plant-village)
2. **Extract** and place the `PlantVillage` folder in `training/`
3. **Run cleanup script**:
   ```bash
   # Windows
   .\setup_dataset.ps1
   
   # Linux/macOS  
   chmod +x setup_dataset.sh
   ./setup_dataset.sh
   ```

📚 **Full dataset instructions**: See [DATASET_SETUP.md](DATASET_SETUP.md)

> **Note**: Pre-trained model is included, so dataset download is optional unless you want to retrain.

### �🛠️ Installation

#### Option 1: Quick Setup (Windows)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/RanjanPM/potato-disease-classification.git
   cd potato-disease-classification
   ```

2. **Install Git LFS and pull large files:**
   ```bash
   git lfs install
   git lfs pull
   ```

3. **Start the API server:**
   ```cmd
   start-api.bat
   ```
   ✅ API will be available at `http://localhost:8000`

4. **Start the React frontend:**
   ```cmd
   start-ui.bat
   ```
   ✅ UI will be available at `http://localhost:3000`

#### Option 2: Cross-Platform Setup

#### Option 2: Cross-Platform Setup

**Backend Setup:**
```bash
# Clone and navigate
git clone https://github.com/RanjanPM/potato-disease-classification.git
cd potato-disease-classification

# Setup Python environment
python -m venv .venv

# Activate virtual environment
# Windows:
.venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Start API server
cd api
python main.py
```

**Frontend Setup:**
```bash
# Navigate to frontend
cd ui/potato-disease-frontend

# Install dependencies
npm install

# Start development server
npm start
```

#### Option 3: Using PowerShell Scripts

1. **Start the API server:**
   ```powershell
   .\start-api.ps1
   ```

2. **Start the React frontend:**
   ```powershell
   .\start-ui.ps1
   ```

### Option 3: Manual Setup

#### Backend Setup

1. **Activate virtual environment:**
   ```cmd
   .venv\Scripts\activate
   ```

2. **Install Python dependencies:**
   ```cmd
   pip install fastapi uvicorn[standard] python-multipart tensorflow numpy pillow
   ```

3. **Start the API server:**
   ```cmd
   cd api
   python main.py
   ```

#### Frontend Setup

1. **Navigate to frontend directory:**
   ```cmd
   cd ui\potato-disease-frontend
   ```

2. **Install dependencies:**
   ```cmd
   npm install
   ```

3. **Start the development server:**
   ```cmd
   npm start
   ```

## 🎯 Features

### Backend API
- **FastAPI** with automatic OpenAPI documentation
- **TensorFlow/Keras** model integration
- **Image preprocessing** and prediction
- **CORS enabled** for frontend integration
- **File upload** support for image analysis

### Frontend React App
- **Modern React with TypeScript**
- **Drag & drop image upload**
- **Real-time prediction results**
- **Confidence scoring with visual indicators**
- **Disease-specific recommendations**
- **Responsive design** for mobile and desktop
- **Professional UI** with smooth animations

### ML Model
- **CNN architecture** trained on PlantVillage dataset
- **Three-class classification:**
  - ✅ Healthy
  - ⚠️ Early Blight
  - 🚨 Late Blight
- **Image preprocessing** and augmentation
- **95%+ accuracy** on test data

## 📡 API Endpoints

### `GET /ping`
Health check endpoint

**Response:**
```json
"Hello, I am alive"
```

### `POST /predict`
Upload an image for disease prediction

**Request:**
- Content-Type: `multipart/form-data`
- Body: Image file (JPG, PNG, GIF)

**Response:**
```json
{
  "class": "Early Blight",
  "confidence": 0.95
}
```

## 🖼️ Supported Image Formats
- JPEG (.jpg, .jpeg)
- PNG (.png)
- GIF (.gif)
- Maximum file size: 10MB

## 🎨 UI Features

### Image Upload
- **Drag & drop interface**
- **Click to browse** file selection
- **Image preview** with clear option
- **File validation** and error handling

### Prediction Results
- **Visual confidence meter**
- **Disease classification** with icons
- **Detailed descriptions** of each condition
- **Treatment recommendations**
- **Professional disclaimer**

### Responsive Design
- **Mobile-friendly** interface
- **Touch-optimized** controls
- **Progressive loading** states
- **Smooth animations** and transitions

## 🔧 Development

### API Development
```cmd
# Activate virtual environment
.venv\Scripts\activate

# Install development dependencies
pip install fastapi uvicorn[standard] python-multipart

# Run with auto-reload
uvicorn api.main:app --reload --host 0.0.0.0 --port 8000
```

### Frontend Development
```cmd
cd ui\potato-disease-frontend

# Install dependencies
npm install

# Start development server
npm start

# Build for production
npm run build
```

## 🌟 Disease Information

### Healthy Leaves
- **Appearance:** Vibrant green, no spots or discoloration
- **Action:** Continue regular monitoring and care

### Early Blight
- **Symptoms:** Dark spots with concentric rings (target spots)
- **Caused by:** *Alternaria solani* fungus
- **Treatment:** Fungicide application, improve air circulation

### Late Blight
- **Symptoms:** Dark, water-soaked lesions with white fuzzy growth
- **Caused by:** *Phytophthora infestans* oomycete
- **Treatment:** Immediate removal, copper-based fungicides

## 🔮 Future Enhancements

- [ ] **More disease classes** (Bacterial spot, Virus infections)
- [ ] **Batch processing** for multiple images
- [ ] **Historical tracking** of predictions
- [ ] **Expert consultation** integration
- [ ] **Mobile app** development
- [ ] **Real-time camera** integration
- [ ] **Geolocation-based** recommendations
- [ ] **Weather integration** for risk assessment

## 🚀 Azure Deployment Ready

This application is structured for easy deployment to Azure:
- **Azure App Service** for the React frontend
- **Azure Container Instances** or **App Service** for the FastAPI backend
- **Azure Blob Storage** for model storage
- **Azure Application Insights** for monitoring

## 📄 License

This project is for educational and research purposes.

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Quick Contribution Steps:
1. 🍴 Fork the repository
2. 🌿 Create a feature branch (`git checkout -b feature/amazing-feature`)
3. 💾 Commit your changes (`git commit -m 'Add amazing feature'`)
4. 📤 Push to the branch (`git push origin feature/amazing-feature`)
5. 🔃 Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **PlantVillage Dataset**: Hughes, D. P., & Salathé, M. (2015)
- **TensorFlow Team**: For the amazing deep learning framework
- **FastAPI**: For the modern, fast web framework
- **React Team**: For the powerful frontend library

## 📊 Project Stats

- 🔬 **Model Accuracy**: 95%+ on test data
- 📸 **Dataset Size**: 2000+ labeled images
- 🏗️ **Architecture**: CNN with 6 convolutional layers
- ⚡ **Inference Time**: <100ms per image
- 📱 **Supported Formats**: JPG, PNG, GIF

## 🔮 Roadmap

- [ ] 📱 Mobile app development
- [ ] 🌐 Multi-language support
- [ ] 🔍 Batch image processing
- [ ] 📊 Analytics dashboard
- [ ] 🤖 Model improvement with more data
- [ ] ☁️ Cloud deployment templates

---

**⚠️ Disclaimer:** This tool provides AI-powered predictions for educational and research purposes. For critical agricultural decisions, always consult with professional plant pathologists or agricultural experts.

**🌟 Star this repo if you found it helpful!**
