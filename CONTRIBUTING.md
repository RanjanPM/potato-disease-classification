# Contributing to Potato Disease Classification System

Thank you for your interest in contributing to this project! This guide will help you get started.

## 🚀 Getting Started

### Prerequisites
- Python 3.8 or higher
- Node.js 16 or higher
- Git
- Git LFS (for large files)

### Setting Up Development Environment

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/potato-disease.git
   cd potato-disease
   ```

3. **Install Git LFS** (if not already installed):
   ```bash
   git lfs install
   ```

4. **Set up Python environment**:
   ```bash
   python -m venv .venv
   # On Windows:
   .venv\Scripts\activate
   # On macOS/Linux:
   source .venv/bin/activate
   
   pip install -r requirements.txt
   ```

5. **Set up React frontend**:
   ```bash
   cd ui/potato-disease-frontend
   npm install
   ```

## 🔧 Development Workflow

### Making Changes

1. **Create a new branch** for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the coding standards below

3. **Test your changes**:
   ```bash
   # Test the API
   cd api
   python main.py
   
   # Test the frontend
   cd ui/potato-disease-frontend
   npm start
   ```

4. **Commit your changes**:
   ```bash
   git add .
   git commit -m "Add: your descriptive commit message"
   ```

5. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request** on GitHub

### Coding Standards

#### Python (Backend)
- Follow PEP 8 style guidelines
- Use type hints where possible
- Write descriptive docstrings
- Keep functions small and focused
- Add error handling and validation

#### TypeScript/React (Frontend)
- Use TypeScript for all new code
- Follow React best practices
- Use functional components with hooks
- Write descriptive component names
- Add proper error boundaries

#### General
- Write clear, descriptive commit messages
- Keep commits atomic (one logical change per commit)
- Update documentation when adding features
- Add comments for complex logic

## 🐛 Bug Reports

When reporting bugs, please include:
- **Environment details** (OS, Python/Node versions)
- **Steps to reproduce** the issue
- **Expected behavior** vs actual behavior
- **Screenshots** if applicable
- **Error messages** or logs

## 💡 Feature Requests

When suggesting new features:
- **Describe the problem** you're trying to solve
- **Explain your proposed solution**
- **Consider alternatives** and trade-offs
- **Think about backward compatibility**

## 📝 Documentation

Help improve our documentation by:
- Fixing typos or unclear explanations
- Adding examples for new features
- Improving code comments
- Creating tutorials or guides

## 🧪 Testing

### API Testing
```bash
# Start the API server
cd api
python main.py

# Test with curl
curl -X POST "http://localhost:8000/predict" \
     -H "accept: application/json" \
     -H "Content-Type: multipart/form-data" \
     -F "file=@test-image.jpg"
```

### Frontend Testing
```bash
cd ui/potato-disease-frontend
npm test
npm run build  # Test production build
```

## 🌟 Areas for Contribution

We welcome contributions in these areas:

### Machine Learning
- Improve model accuracy
- Add new disease classes
- Implement transfer learning
- Add data augmentation techniques

### Backend Development
- Add more API endpoints
- Improve error handling
- Add input validation
- Implement caching

### Frontend Development
- Enhance user interface
- Add new features
- Improve mobile responsiveness
- Add accessibility features

### Documentation
- Tutorial creation
- API documentation
- Code examples
- Architecture diagrams

### DevOps
- Docker containerization
- CI/CD pipelines
- Deployment scripts
- Monitoring setup

## 📧 Questions?

If you have questions about contributing, feel free to:
- Open an issue for discussion
- Check existing issues and pull requests
- Review the project documentation

## 🏆 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes for significant contributions
- Project documentation

Thank you for contributing to making agricultural technology more accessible! 🌱
