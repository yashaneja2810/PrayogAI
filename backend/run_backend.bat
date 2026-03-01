@echo off
REM Smart Backend Runner - Batch version
echo Starting Backend Server...
echo.

REM Navigate to the script directory
cd /d "%~dp0"

REM Check if dependencies are installed
echo Checking dependencies...
python -c "import fastapi, uvicorn, supabase, sentence_transformers, torch" 2>nul
if errorlevel 1 (
    echo.
    echo ========================================
    echo   Dependencies Missing!
    echo ========================================
    echo.
    echo Required packages are not installed.
    echo.
    echo Run this command to install dependencies:
    echo   setup_backend.bat
    echo.
    echo Or install manually:
    echo   pip install -r requirements.txt
    echo.
    pause
    exit /b 1
)

echo [OK] All dependencies found!
echo.
echo ========================================
echo   Starting Uvicorn Server...
echo ========================================
echo.

REM Start the server
uvicorn app.main:app --reload
