@echo off
REM Quick fix - Install only the missing package
echo Installing sentence-transformers (the package you need)...
echo.
pip install sentence-transformers
echo.
echo Done! Now try running: uvicorn app.main:app --reload
pause
