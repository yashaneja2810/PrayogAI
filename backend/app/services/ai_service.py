from ..core.config import get_settings

settings = get_settings()

import asyncio
from threading import Lock

class AIService:
    _instance = None
    _client = None
    _lock = Lock()
    _initialized = False

    def __new__(cls):
        if cls._instance is None:
            with cls._lock:
                if cls._instance is None:
                    cls._instance = super(AIService, cls).__new__(cls)
                    cls._instance._initialized = False
        return cls._instance

    def __init__(self):
        if self._initialized:
            return
        with self._lock:
            if not self._initialized:
                self._client = None
                self._initialized = True

    def _base_system_prompt(self) -> str:
        return (
            "You are a helpful assistant for a bot-based chat application. "
            "Use the provided bot knowledge when it is present. "
            "If the knowledge does not contain the answer, respond naturally and avoid mentioning internal retrieval details. "
            "Keep answers concise, accurate, and well formatted with markdown when useful."
        )

    @property
    def client(self):
        if self._client is None:
            try:
                from groq import Groq

                if not settings.GROQ_API_KEY:
                    raise RuntimeError("GROQ_API_KEY is not set.")

                self._client = Groq(api_key=settings.GROQ_API_KEY)
            except ImportError:
                raise RuntimeError("Failed to initialize Groq client. Please check your installation.")
        return self._client

    def _generate_response_sync(self, question: str, context: str = "") -> str:
        messages = [
            {
                "role": "system",
                "content": self._base_system_prompt(),
            }
        ]

        if context:
            messages.append(
                {
                    "role": "system",
                    "content": f"Bot knowledge and instructions:\n{context}",
                }
            )

        messages.append(
            {
                "role": "user",
                "content": question,
            }
        )

        response = self.client.chat.completions.create(
            model=settings.GROQ_MODEL,
            messages=messages,
            temperature=0.2,
        )

        choice = response.choices[0] if response.choices else None
        message = getattr(choice, "message", None) if choice else None
        content = getattr(message, "content", None) if message else None
        if not content:
            raise RuntimeError("Groq returned an empty response.")
        return content

    async def generate_response(self, prompt: str, context: str = "") -> str:
        """Generate a response using the Groq chat model"""
        try:
            return await asyncio.to_thread(self._generate_response_sync, prompt, context)
        except Exception as e:
            raise RuntimeError(f"Error generating AI response: {str(e)}")