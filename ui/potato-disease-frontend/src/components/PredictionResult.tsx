import React from 'react';
import { PredictionResponse } from '../types';
import './PredictionResult.css';

interface PredictionResultProps {
  prediction: PredictionResponse;
}

const PredictionResult: React.FC<PredictionResultProps> = ({ prediction }) => {
  const getConfidenceColor = (confidence: number) => {
    if (confidence >= 0.8) return '#4CAF50'; // Green
    if (confidence >= 0.6) return '#FF9800'; // Orange
    return '#F44336'; // Red
  };

  const getResultIcon = (className: string) => {
    switch (className.toLowerCase()) {
      case 'healthy':
        return '✅';
      case 'early blight':
        return '⚠️';
      case 'late blight':
        return '🚨';
      default:
        return '🔍';
    }
  };

  const getResultDescription = (className: string) => {
    switch (className.toLowerCase()) {
      case 'healthy':
        return 'The potato leaf appears to be healthy with no signs of disease.';
      case 'early blight':
        return 'Early blight detected. This is a common fungal disease that causes dark spots with concentric rings.';
      case 'late blight':
        return 'Late blight detected. This is a serious disease that can cause significant crop damage.';
      default:
        return 'Classification completed.';
    }
  };

  const getRecommendations = (className: string) => {
    switch (className.toLowerCase()) {
      case 'healthy':
        return [
          'Continue regular monitoring',
          'Maintain proper plant spacing',
          'Ensure adequate nutrition'
        ];
      case 'early blight':
        return [
          'Remove affected leaves immediately',
          'Apply fungicide treatment',
          'Improve air circulation',
          'Avoid overhead watering'
        ];
      case 'late blight':
        return [
          'Remove infected plants immediately',
          'Apply copper-based fungicide',
          'Improve drainage',
          'Consider resistant varieties for future planting'
        ];
      default:
        return [];
    }
  };

  const confidencePercentage = Math.round(prediction.confidence * 100);

  return (
    <div className="prediction-result">
      <div className="result-header">
        <div className="result-icon">
          {getResultIcon(prediction.class)}
        </div>
        <div className="result-info">
          <h2 className="result-class">{prediction.class}</h2>
          <div className="confidence-container">
            <div 
              className="confidence-bar"
              style={{ 
                width: `${confidencePercentage}%`,
                backgroundColor: getConfidenceColor(prediction.confidence)
              }}
            />
            <span 
              className="confidence-text"
              style={{ color: getConfidenceColor(prediction.confidence) }}
            >
              {confidencePercentage}% confidence
            </span>
          </div>
        </div>
      </div>

      <div className="result-description">
        <p>{getResultDescription(prediction.class)}</p>
      </div>

      {getRecommendations(prediction.class).length > 0 && (
        <div className="recommendations">
          <h3>Recommendations:</h3>
          <ul>
            {getRecommendations(prediction.class).map((rec, index) => (
              <li key={index}>{rec}</li>
            ))}
          </ul>
        </div>
      )}

      <div className="result-disclaimer">
        <p><small>
          ⚠️ This is an AI-powered prediction. For serious plant health concerns, 
          consult with a professional agricultural expert or plant pathologist.
        </small></p>
      </div>
    </div>
  );
};

export default PredictionResult;
