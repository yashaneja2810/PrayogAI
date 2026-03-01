@echo off
REM Simple setup script for backend - Installs to system Python
echo ========================================
echo   Backend Environment Setup
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found. Please install Python 3.10 or higher.
    pause
    exit /b 1
)

echo [OK] Python found
echo.

REM Navigate to the script directory
cd /d "%~dp0"

REM Install/upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install dependencies
echo.
echo Installing dependencies from requirements.txt...
echo (This may take several minutes...)
echo.
pip install -r requirements.txt

REM Verify installation
echo.
echo Verifying installation...
python -c "import fastapi, uvicorn, supabase, sentence_transformers, torch; print('[OK] All critical packages installed!')" 2>nul
if errorlevel 1 (
    echo [WARNING] Some packages may not be installed correctly
    echo Try running the server anyway with: run_backend.bat
    pause
    exit /b 1
)

echo.
echo ========================================
echo   Setup Complete!
echo ========================================
echo.
echo To start the server, run:
echo   run_backend.bat
echo.
echo Or simply run:
echo   uvicorn app.main:app --reload
echo.
pause
