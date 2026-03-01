# Smart Backend Runner - Automatically checks dependencies before running
# This script will detect if dependencies are missing and guide you to install them

Write-Host "Starting Backend Server..." -ForegroundColor Cyan
Write-Host ""

# Navigate to backend directory
Set-Location $PSScriptRoot

# Check if virtual environment exists
if (-not (Test-Path ".venv")) {
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "  Virtual Environment Not Found!" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "This is likely a fresh copy of the project." -ForegroundColor White
    Write-Host "You need to set up the environment first." -ForegroundColor White
    Write-Host ""
    Write-Host "Run this command to set up:" -ForegroundColor Cyan
    Write-Host "  .\setup_backend.ps1" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

# Activate virtual environment
Write-Host "Activating virtual environment..." -ForegroundColor Gray
try {
    .\.venv\Scripts\Activate.ps1
} catch {
    Write-Host "Failed to activate virtual environment." -ForegroundColor Red
    Write-Host "Try running: .\setup_backend.ps1" -ForegroundColor Yellow
    exit 1
}

# Check if critical dependencies are installed
Write-Host "Checking dependencies..." -ForegroundColor Gray
$dependenciesOk = $true

try {
    python -c "import fastapi, uvicorn, supabase, sentence_transformers, torch" 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        $dependenciesOk = $false
    }
} catch {
    $dependenciesOk = $false
}

if (-not $dependenciesOk) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "  Dependencies Missing!" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Required packages are not installed." -ForegroundColor White
    Write-Host ""
    Write-Host "Run this command to install dependencies:" -ForegroundColor Cyan
    Write-Host "  .\setup_backend.ps1" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Or install manually:" -ForegroundColor Cyan
    Write-Host "  pip install -r requirements.txt" -ForegroundColor Yellow
    Write-Host ""
    exit 1
}

# All checks passed, start the server
Write-Host "✓ All dependencies found!" -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Starting Uvicorn Server..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Start the server
uvicorn app.main:app --reload
