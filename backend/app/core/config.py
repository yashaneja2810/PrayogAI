from pydantic_settings import BaseSettings
from functools import lru_cache
from typing import Optional
import os
from dotenv import load_dotenv

load_dotenv()

class Settings(BaseSettings):
    # API Settings
    PROJECT_NAME: str = "Chatbot Builder API"
    VERSION: str = "1.0.0"

    # Frontend URL for CORS
    FRONTEND_URL: str = os.getenv("FRONTEND_URL", "http://localhost:5173")

    # JWT Settings
    JWT_SECRET: str = os.getenv("JWT_SECRET", "your_jwt_secret_here")
    JWT_ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30

    # Supabase Settings
    VITE_SUPABASE_URL: str = os.getenv("VITE_SUPABASE_URL", "")
    VITE_SUPABASE_ANON_KEY: str = os.getenv("VITE_SUPABASE_ANON_KEY", "")

    # Groq API Settings
    GROQ_API_KEY: str = os.getenv("GROQ_API_KEY", "")
    GROQ_MODEL: str = os.getenv("GROQ_MODEL", "llama-3.3-70b-versatile")

    # Qdrant Settings
    QDRANT_HOST: str = os.getenv("QDRANT_HOST", "localhost")
    QDRANT_PORT: int = int(os.getenv("QDRANT_PORT", "6333"))
    QDRANT_API_KEY: Optional[str] = os.getenv("QDRANT_API_KEY", None)
    QDRANT_URL: Optional[str] = os.getenv("QDRANT_URL", None)  # For cloud instances

    class Config:
        env_file = ".env"

@lru_cache()
def get_settings() -> Settings:
    return Settings()

settings = get_settings()
