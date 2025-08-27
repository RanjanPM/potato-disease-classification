import React, { useState } from 'react';
import './App.css';
import ImageUploader from './components/ImageUploader';
import PredictionResult from './components/PredictionResult';
import { PredictionResponse } from './types';

function App() {
  const [prediction, setPrediction] = useState<PredictionResponse | null>(null);
  const [loading, setLoading] = useState(false);

  const handlePrediction = (result: PredictionResponse) => {
    setPrediction(result);
    setLoading(false);
  };

  const handleLoading = (isLoading: boolean) => {
    setLoading(isLoading);
    if (isLoading) {
      setPrediction(null);
    }
  };

  const handleClear = () => {
    setPrediction(null);
    setLoading(false);
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>🥔 Potato Disease Classifier</h1>
        <p>Upload an image of a potato leaf to detect diseases</p>
      </header>
      
      <main className="main-content">
        <ImageUploader 
          onPrediction={handlePrediction}
          onLoading={handleLoading}
          onClear={handleClear}
        />
        
        {loading && (
          <div className="loading">
            <div className="spinner"></div>
            <p>Analyzing image...</p>
          </div>
        )}
        
        {prediction && !loading && (
          <PredictionResult prediction={prediction} />
        )}
      </main>
      
      <footer>
        <p>Powered by TensorFlow & FastAPI</p>
      </footer>
    </div>
  );
}

export default App;
