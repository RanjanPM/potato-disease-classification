import React, { useState, useRef } from 'react';
import axios from 'axios';
import { PredictionResponse } from '../types';
import './ImageUploader.css';

interface ImageUploaderProps {
  onPrediction: (prediction: PredictionResponse) => void;
  onLoading: (loading: boolean) => void;
  onClear?: () => void;
}

const ImageUploader: React.FC<ImageUploaderProps> = ({ onPrediction, onLoading, onClear }) => {
  const [selectedImage, setSelectedImage] = useState<File | null>(null);
  const [previewUrl, setPreviewUrl] = useState<string>('');
  const [error, setError] = useState<string>('');
  const fileInputRef = useRef<HTMLInputElement>(null);

  const API_BASE_URL = 'http://localhost:8000';

  const handleImageSelect = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file) {
      // Validate file type
      if (!file.type.startsWith('image/')) {
        setError('Please select a valid image file');
        return;
      }

      // Validate file size (max 10MB)
      if (file.size > 10 * 1024 * 1024) {
        setError('File size must be less than 10MB');
        return;
      }

      setSelectedImage(file);
      setError('');
      
      // Create preview URL
      const reader = new FileReader();
      reader.onload = (e) => {
        setPreviewUrl(e.target?.result as string);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleDrop = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
    const file = event.dataTransfer.files[0];
    if (file) {
      // Create a new FileList-like object
      const fileList = {
        0: file,
        length: 1,
        item: (index: number) => index === 0 ? file : null,
        [Symbol.iterator]: function* () {
          yield file;
        }
      } as FileList;

      // Simulate file input change
      const fakeEvent = {
        target: { files: fileList }
      } as React.ChangeEvent<HTMLInputElement>;
      handleImageSelect(fakeEvent);
    }
  };

  const handleDragOver = (event: React.DragEvent<HTMLDivElement>) => {
    event.preventDefault();
  };

  const predictImage = async () => {
    if (!selectedImage) {
      setError('Please select an image first');
      return;
    }

    onLoading(true);
    setError('');

    try {
      const formData = new FormData();
      formData.append('file', selectedImage);

      const response = await axios.post(`${API_BASE_URL}/predict`, formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        timeout: 30000, // 30 seconds timeout
      });

      onPrediction(response.data);
    } catch (err: any) {
      console.error('Prediction error:', err);
      if (err.code === 'ECONNABORTED') {
        setError('Request timeout. Please try again.');
      } else if (err.response?.status === 422) {
        setError('Invalid image format. Please try a different image.');
      } else if (err.response?.status >= 500) {
        setError('Server error. Please check if the API is running on http://localhost:8000');
      } else {
        setError(err.response?.data?.detail || 'Failed to predict. Please try again.');
      }
      onLoading(false);
    }
  };

  const clearImage = () => {
    setSelectedImage(null);
    setPreviewUrl('');
    setError('');
    if (fileInputRef.current) {
      fileInputRef.current.value = '';
    }
    // Clear prediction results in parent component
    if (onClear) {
      onClear();
    }
  };

  return (
    <div className="image-uploader">
      <div 
        className={`upload-zone ${selectedImage ? 'has-image' : ''}`}
        onDrop={handleDrop}
        onDragOver={handleDragOver}
        onClick={() => fileInputRef.current?.click()}
      >
        {previewUrl ? (
          <div className="image-preview">
            <img src={previewUrl} alt="Selected" />
            <button 
              className="clear-button"
              onClick={(e) => {
                e.stopPropagation();
                clearImage();
              }}
            >
              ✕
            </button>
          </div>
        ) : (
          <div className="upload-placeholder">
            <div className="upload-icon">📸</div>
            <p>Click to upload or drag & drop</p>
            <p className="upload-hint">Supported: JPG, PNG, GIF (max 10MB)</p>
          </div>
        )}
      </div>

      <input
        ref={fileInputRef}
        type="file"
        accept="image/*"
        onChange={handleImageSelect}
        style={{ display: 'none' }}
      />

      {error && (
        <div className="error-message">
          ⚠️ {error}
        </div>
      )}

      {selectedImage && (
        <div className="upload-actions">
          <button 
            className="predict-button"
            onClick={predictImage}
          >
            🔍 Analyze Image
          </button>
          <button 
            className="clear-button-secondary"
            onClick={clearImage}
          >
            Clear
          </button>
        </div>
      )}
    </div>
  );
};

export default ImageUploader;
