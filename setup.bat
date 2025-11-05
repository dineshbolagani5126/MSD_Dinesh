@echo off
echo ========================================
echo Exam Portal - Complete Setup Script
echo ========================================
echo.

echo Step 1: Installing Backend Dependencies...
cd backend
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Backend installation failed!
    pause
    exit /b %errorlevel%
)
echo Backend dependencies installed successfully!
echo.

echo Step 2: Installing Frontend Dependencies...
cd ..\frontend
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Frontend installation failed!
    pause
    exit /b %errorlevel%
)
echo Frontend dependencies installed successfully!
echo.

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Create backend/.env file from backend/.env.example
echo 2. Update the .env file with your MongoDB URI and other settings
echo 3. Start MongoDB service
echo 4. Run start-dev.bat to start both servers
echo.
pause
