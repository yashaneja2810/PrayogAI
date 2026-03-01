# Backend Quick Start Guide

## 🚨 IMPORTANT: First Time Setup

**If you've just copied this project to a new folder, you MUST run the setup script before starting the server!**

### Why do I get "ModuleNotFoundError"?

When you copy a Python project to a new location, the Python packages (dependencies) are NOT copied with it. You need to install them in each new location.

---

## 🚀 Quick Start (After copying project)

### Step 1: Run Setup Script
Open PowerShell in the `backend` folder and run:

```powershell
.\setup_backend.ps1
```

This will:
- Create a virtual environment
- Install all required dependencies (including `sentence_transformers`)
- Verify everything is installed correctly

**This takes 5-10 minutes on first run.**

### Step 2: Run the Server
After setup is complete, use the smart run script:

```powershell
.\run_backend.ps1
```

This script automatically:
- Checks if dependencies are installed
- Activates the virtual environment
- Starts the server

---

## 📋 Alternative: Manual Setup

If you prefer to set up manually:

```powershell
# Create virtual environment
python -m venv .venv

# Activate it
.\.venv\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt

# Run the server
uvicorn app.main:app --reload
```

---

## 🔧 Troubleshooting

### Error: "No module named 'sentence_transformers'"
**Solution:** You didn't run the setup script. Run `.\setup_backend.ps1`

### Error: "Virtual environment not found"
**Solution:** Run `.\setup_backend.ps1` to create it

### Error: "Python not found"
**Solution:** Install Python 3.10 or higher from python.org

### Setup script fails during installation
**Solution:** 
1. Check your internet connection
2. Try running again: `.\setup_backend.ps1`
3. If it still fails, install manually: `pip install -r requirements.txt`

---

## 📦 What Gets Installed?

The setup script installs all dependencies from `requirements.txt`, including:

- **FastAPI** - Web framework
- **Uvicorn** - ASGI server
- **Supabase** - Database client
- **sentence-transformers** - ML embeddings
- **torch** - PyTorch for ML
- **qdrant-client** - Vector database
- And many more...

---

## ⚡ Daily Usage

Once you've run setup once, you can start the server quickly with:

```powershell
.\run_backend.ps1
```

The run script will check if everything is set up correctly before starting.

---

## 🔄 Updating Dependencies

If requirements.txt changes, run:

```powershell
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

---

## 💡 Pro Tips

1. **Always use the virtual environment** - Don't install packages globally
2. **Run setup_backend.ps1 after copying project** - This is the #1 cause of errors
3. **Use run_backend.ps1 for daily work** - It catches common issues automatically
4. **Keep requirements.txt updated** - Add new packages to requirements.txt so others can install them

---

## 📞 Still Having Issues?

Common issues:
- **Port already in use**: Another instance is running. Kill it or use a different port: `uvicorn app.main:app --reload --port 8001`
- **Database connection errors**: Check your .env file has correct Supabase credentials
- **Import errors**: Run `.\setup_backend.ps1` again

---

## 🎯 Summary

**After copying project:**
```powershell
cd backend
.\setup_backend.ps1    # First time only
.\run_backend.ps1       # Every time you want to run the server
```

That's it! 🎉
