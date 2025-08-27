export interface PredictionResponse {
  class: string;
  confidence: number;
}

export interface ApiError {
  detail?: string;
  message?: string;
}
