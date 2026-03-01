# Backend Setup Script - Run this after copying the project to a new folder
# This script will set up the Python environment and install all dependencies

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Backend Environment Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Python not found. Please install Python 3.10 or higher." -ForegroundColor Red
    exit 1
}

# Navigate to backend directory
Set-Location $PSScriptRoot

# Remove existing virtual environment if it exists
if (Test-Path ".venv") {
    Write-Host "Removing existing virtual environment..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force .venv
}

# Create new virtual environment
Write-Host "Creating new virtual environment..." -ForegroundColor Yellow
python -m venv .venv

# Activate virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Yellow
.\.venv\Scripts\Activate.ps1

# Upgrade pip
Write-Host "Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip setuptools wheel

# Install dependencies
Write-Host "Installing dependencies from requirements.txt..." -ForegroundColor Yellow
Write-Host "(This may take several minutes...)" -ForegroundColor Gray
pip install -r requirements.txt

# Verify critical packages
Write-Host ""
Write-Host "Verifying critical packages..." -ForegroundColor Yellow
try {
    python -c "import fastapi; import uvicorn; import supabase; import sentence_transformers; import torch; print('✓ All critical packages installed successfully!')"
    Write-Host "✓ All critical packages verified!" -ForegroundColor Green
} catch {
    Write-Host "✗ Some packages failed to install. Please check the errors above." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "To start the backend server, run:" -ForegroundColor Cyan
Write-Host "  .\.venv\Scripts\Activate.ps1" -ForegroundColor Yellow
Write-Host "  uvicorn app.main:app --reload" -ForegroundColor Yellow
Write-Host ""
Write-Host "Or use the run script:" -ForegroundColor Cyan
Write-Host "  .\run_backend.ps1" -ForegroundColor Yellow
Write-Host ""
