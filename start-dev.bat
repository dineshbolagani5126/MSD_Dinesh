@echo off
echo ========================================
echo Starting Exam Portal Development Servers
echo ========================================
echo.

echo Starting Backend Server...
start "Exam Portal Backend" cmd /k "cd backend && npm run dev"
timeout /t 3 /nobreak >nul

echo Starting Frontend Server...
start "Exam Portal Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo ========================================
echo Both servers are starting...
echo ========================================
echo.
echo Backend: http://localhost:5000
echo Frontend: http://localhost:5173
echo.
echo Press any key to close this window (servers will keep running)
pause >nul
