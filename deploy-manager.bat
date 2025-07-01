@echo off
title IDM-VTON Deployment Manager
color 0B
echo.
echo ███████████████████████████████████████████████
echo █                                             █
echo █     IDM-VTON Deployment Manager             █
echo █     Virtual Try-On with GitHub Actions      █
echo █                                             █
echo ███████████████████████████████████████████████
echo.
echo Choose your deployment option:
echo.
echo [1] 🔧 Complete Setup (First time setup)
echo [2] 🚀 Deploy Frontend (Regular deployment)  
echo [3] ⚡ Quick Deploy (Fast update)
echo [4] 🌐 Open Web Interface
echo [5] 📁 Open GitHub Repository
echo [6] ❌ Exit
echo.
set /p choice="Enter your choice (1-6): "

if "%choice%"=="1" goto setup
if "%choice%"=="2" goto deploy
if "%choice%"=="3" goto quick
if "%choice%"=="4" goto web
if "%choice%"=="5" goto github
if "%choice%"=="6" goto exit
goto menu

:setup
echo.
echo Running complete setup...
call setup-complete.bat
goto end

:deploy
echo.
echo Running frontend deployment...
call deploy-frontend.bat
goto end

:quick
echo.
echo Running quick deployment...
call quick-deploy.bat
goto end

:web
echo.
echo Opening web interface...
start https://zoneshosting.github.io/IDM-VTON-Actions
echo ✅ Web interface opened in browser
timeout /t 2 /nobreak > nul
goto menu

:github
echo.
echo Opening GitHub repository...
start https://github.com/zoneshosting/IDM-VTON-Actions
echo ✅ GitHub repository opened in browser
timeout /t 2 /nobreak > nul
goto menu

:exit
echo.
echo 👋 Goodbye! Thanks for using IDM-VTON!
timeout /t 2 /nobreak > nul
exit

:end
echo.
echo Press any key to return to menu or close window to exit...
pause > nul
goto menu

:menu
cls
goto start
