# 🤖 AI Chatbot Builder Platform

[![FastAPI](https://img.shields.io/badge/FastAPI-0.115.10-009688?style=flat&logo=fastapi)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-18.3.1-61DAFB?style=flat&logo=react)](https://reactjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.5.3-3178C6?style=flat&logo=typescript)](https://www.typescriptlang.org/)
[![Python](https://img.shields.io/badge/Python-3.11-3776AB?style=flat&logo=python)](https://www.python.org/)

An enterprise-grade full-stack platform that enables users to create, manage, and deploy custom AI chatbots trained on their own documents. Built with cutting-edge AI technologies including Google Gemini, vector databases, and semantic search capabilities.

## ✨ Features

### 🎯 Core Functionality
- **Custom Chatbot Creation** - Build AI chatbots tailored to your business needs
- **Document-Based Training** - Upload PDF/DOCX documents to train your bots
- **Semantic Search** - Powered by Qdrant vector database and Sentence Transformers
- **RAG Architecture** - Retrieval Augmented Generation for accurate, context-aware responses
- **Multi-Bot Management** - Create and manage multiple chatbots from a single dashboard

### 🔐 Security & Authentication
- **Supabase Authentication** - Secure user registration and login
- **JWT Token Management** - Protected API endpoints
- **Role-Based Access** - Per-bot access control
- **Public Widget Access** - Anonymous chat access for embedded widgets

### 💬 Chat Features
- **Real-Time Conversations** - Instant AI-powered responses
- **Context-Aware Replies** - Uses document context for accurate answers
- **Chat History** - Conversation persistence
- **Embeddable Widgets** - Generate code to embed chatbots on any website

### 📊 User Interface
- **Intuitive Dashboard** - Clean, modern React interface
- **Bot Analytics** - Track performance and usage statistics
- **Responsive Design** - Works seamlessly on desktop and mobile
- **Dark Mode Ready** - Beautiful TailwindCSS styling

## 🛠️ Tech Stack

### Backend
- **Framework:** FastAPI (Python 3.11)
- **AI/ML:** 
  - Google Gemini 2.5 Flash (LLM)
  - Sentence Transformers (Embeddings)
  - LangChain (AI Orchestration)
  - PyTorch (ML Framework)
- **Vector Database:** Qdrant
- **Authentication:** Supabase
- **Document Processing:** PyPDF2, python-docx
- **Security:** python-jose, passlib

### Frontend
- **Framework:** React 18 with TypeScript
- **Build Tool:** Vite
- **Routing:** React Router v7
- **Styling:** TailwindCSS
- **Animations:** Framer Motion
- **HTTP Client:** Axios
- **Icons:** Lucide React

### DevOps & Deployment
- **Containerization:** Docker & Docker Compose
- **Deployment:** Render.com ready
- **CI/CD:** GitHub Actions compatible
- **Environment Management:** python-dotenv

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Python 3.11+** - [Download](https://www.python.org/downloads/)
- **Node.js 18+** - [Download](https://nodejs.org/)
- **Docker & Docker Compose** (Optional) - [Download](https://www.docker.com/)
- **Git** - [Download](https://git-scm.com/)

### Required API Keys
- **Google AI Studio API Key** - [Get it here](https://makersuite.google.com/app/apikey)
- **Supabase Project** - [Create project](https://supabase.com/)
- **Qdrant Cloud Account** (Optional) - [Sign up](https://cloud.qdrant.io/)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/genai-services.git
cd genai-services
```

### 2. Backend Setup

```bash
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Create .env file
cp .env.example .env
```

### 3. Configure Environment Variables

Edit `backend/.env` with your credentials:

```env
# Supabase Configuration
SUPABASE_URL=your_supabase_url
SUPABASE_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key

# Google AI Configuration
GOOGLE_API_KEY=your_google_ai_api_key

# Qdrant Configuration (Cloud)
QDRANT_URL=your_qdrant_cloud_url
QDRANT_API_KEY=your_qdrant_api_key

# Or Qdrant Configuration (Local)
QDRANT_HOST=localhost
QDRANT_PORT=6333

# JWT Configuration
SECRET_KEY=your_secret_key_here
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

# CORS
FRONTEND_URL=http://localhost:5173
```

### 4. Initialize Database

```bash
# Run migrations
python -m app.services.migrate_to_qdrant
```

### 5. Start Backend Server

```bash
# Development mode
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

# Or use the main.py entry point
python main.py
```

Backend will be available at: `http://localhost:8000`
API Documentation: `http://localhost:8000/docs`

### 6. Frontend Setup

Open a new terminal:

```bash
cd frontend

# Install dependencies
npm install

# Create .env file
cp .env.example .env
```

Edit `frontend/.env`:

```env
VITE_API_URL=http://localhost:8000
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 7. Start Frontend Development Server

```bash
npm run dev
```

Frontend will be available at: `http://localhost:5173`

## 🐳 Docker Deployment

### Using Docker Compose

```bash
# Build and start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

Services will be available at:
- Frontend: `http://localhost:5173`
- Backend: `http://localhost:8000`
- Qdrant: `http://localhost:6333`

## 📖 Usage Guide

### Creating Your First Chatbot

1. **Sign Up / Login**
   - Navigate to `http://localhost:5173`
   - Create an account or log in

2. **Create a New Bot**
   - Click "Create New Bot"
   - Enter your company/bot name
   - Upload training documents (PDF/DOCX)
   - Click "Create Bot"

3. **Test Your Bot**
   - Use the built-in chat widget to test responses
   - Ask questions related to your uploaded documents

4. **Deploy Your Bot**
   - Generate embeddable widget code
   - Copy and paste into your website
   - Customize appearance as needed

### Embedding the Chat Widget

```html
<!-- Add this to your website -->
<div id="chatbot-widget"></div>
<script src="https://your-domain.com/widget/widget.js"></script>
<script>
  ChatWidget.init({
    botId: 'your-bot-id',
    containerId: 'chatbot-widget'
  });
</script>
```

## 📁 Project Structure

```
genai-services/
├── backend/
│   ├── app/
│   │   ├── api/              # API endpoints
│   │   │   ├── auth.py       # Authentication routes
│   │   │   ├── endpoints.py  # Main API routes
│   │   │   └── dependencies.py
│   │   ├── core/             # Core configuration
│   │   │   └── config.py
│   │   ├── models/           # Data models
│   │   │   ├── auth.py
│   │   │   ├── bot.py
│   │   │   ├── schemas.py
│   │   │   └── user.py
│   │   ├── services/         # Business logic
│   │   │   ├── ai_service.py       # Google Gemini integration
│   │   │   ├── auth.py             # Auth service
│   │   │   ├── bot.py              # Bot management
│   │   │   ├── chat.py             # Chat service
│   │   │   ├── vector_store.py     # Qdrant operations
│   │   │   └── recovery.py
│   │   ├── utils/            # Utilities
│   │   │   ├── document_processor.py
│   │   │   ├── json_encoder.py
│   │   │   └── serializers.py
│   │   └── main.py           # FastAPI app
│   ├── requirements.txt
│   ├── runtime.txt
│   └── Procfile
├── frontend/
│   ├── src/
│   │   ├── components/       # React components
│   │   │   ├── AuthForm.tsx
│   │   │   ├── ChatWidget.tsx
│   │   │   ├── Navigation.tsx
│   │   │   └── ProtectedRoute.tsx
│   │   ├── pages/            # Page components
│   │   │   ├── BotsList.tsx
│   │   │   ├── CreateBot.tsx
│   │   │   ├── Dashboard.tsx
│   │   │   ├── Login.tsx
│   │   │   └── SignUp.tsx
│   │   ├── context/          # React context
│   │   │   └── AuthContext.tsx
│   │   ├── lib/              # API clients
│   │   │   ├── api.ts
│   │   │   └── botApi.ts
│   │   ├── App.tsx
│   │   └── main.tsx
│   ├── public/
│   │   └── widget/           # Embeddable widget
│   ├── package.json
│   └── vite.config.ts
├── docker-compose.yml
└── README.md
```

## 🔌 API Documentation

### Authentication Endpoints

#### Register User
```http
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "securepassword",
  "full_name": "John Doe"
}
```

#### Login
```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "securepassword"
}
```

### Bot Management Endpoints

#### Create Bot
```http
POST /api/bots
Authorization: Bearer {token}
Content-Type: multipart/form-data

name: My Bot
documents: [file1.pdf, file2.pdf]
```

#### Get User's Bots
```http
GET /api/bots
Authorization: Bearer {token}
```

#### Get Bot Documents
```http
GET /api/bots/{bot_id}/documents
Authorization: Bearer {token}
```

### Chat Endpoints

#### Send Message
```http
POST /api/chat
Content-Type: application/json

{
  "bot_id": "uuid",
  "message": "What is your refund policy?",
  "user_id": "uuid (optional)"
}
```

Full API documentation available at: `http://localhost:8000/docs`

## 🧪 Testing

### Backend Tests

```bash
cd backend

# Run API tests
python test_api.py

# Run Qdrant tests
python test_qdrant.py
```

### Frontend Tests

```bash
cd frontend

# Run tests
npm run test

# Type checking
npm run typecheck

# Linting
npm run lint
```

## 🔧 Configuration

### Backend Configuration (`backend/app/core/config.py`)

```python
class Settings(BaseSettings):
    # Application
    APP_NAME: str = "Chatbot Builder API"
    DEBUG: bool = False
    
    # Database
    SUPABASE_URL: str
    SUPABASE_KEY: str
    
    # AI
    GOOGLE_API_KEY: str
    
    # Vector Store
    QDRANT_URL: Optional[str] = None
    QDRANT_HOST: str = "localhost"
    QDRANT_PORT: int = 6333
```

### Frontend Configuration

```typescript
// vite.config.ts
export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    proxy: {
      '/api': 'http://localhost:8000'
    }
  }
})
```

## 🚀 Deployment

### Deploy to Render.com

1. **Backend:**
   - Connect your GitHub repository
   - Select `backend` as root directory
   - Use `render.yaml` for configuration
   - Add environment variables in Render dashboard

2. **Frontend:**
   - Deploy as Static Site
   - Build command: `npm run build`
   - Publish directory: `dist`

### Deploy to Vercel (Frontend)

```bash
cd frontend
npm install -g vercel
vercel
```

### Deploy to Railway (Backend)

```bash
cd backend
railway login
railway init
railway up
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow PEP 8 for Python code
- Use ESLint and Prettier for TypeScript/React code
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

## 🐛 Troubleshooting

### Common Issues

**Issue: Qdrant connection failed**
```bash
# Solution: Start Qdrant locally
docker run -p 6333:6333 qdrant/qdrant
```

**Issue: Model download fails**
```bash
# Solution: Download model manually
python backend/download_model.py
```

**Issue: CORS errors**
```bash
# Solution: Check FRONTEND_URL in backend/.env
FRONTEND_URL=http://localhost:5173
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [FastAPI](https://fastapi.tiangolo.com/) - Modern Python web framework
- [Google Gemini](https://deepmind.google/technologies/gemini/) - Advanced AI model
- [Qdrant](https://qdrant.tech/) - Vector similarity search engine
- [Sentence Transformers](https://www.sbert.net/) - State-of-the-art embeddings
- [Supabase](https://supabase.com/) - Open source Firebase alternative
- [React](https://reactjs.org/) - JavaScript library for building UIs
- [TailwindCSS](https://tailwindcss.com/) - Utility-first CSS framework

## 📧 Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/genai-services](https://github.com/yourusername/genai-services)

---

<div align="center">
  <p>Built with ❤️ using AI and Modern Web Technologies</p>
  <p>⭐ Star this repo if you find it helpful!</p>
</div>
