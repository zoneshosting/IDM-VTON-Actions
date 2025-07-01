@echo off
title IDM-VTON Quick Deploy
echo.
echo 🚀 IDM-VTON Quick Deploy
echo ========================
echo.

:: Change to project directory
cd /d "D:\00 Github\IDM-VirtualTryOn"

:: Quick git add, commit, and push
echo Adding files...
git add .

echo Committing changes...
git commit -m "update: frontend and documentation changes"

echo Pushing to GitHub...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ SUCCESS! Changes deployed to GitHub
    echo 🌐 Web interface: https://zoneshosting.github.io/IDM-VTON-Actions
    echo.
    timeout /t 3 /nobreak > nul
    start https://zoneshosting.github.io/IDM-VTON-Actions
) else (
    echo.
    echo ❌ FAILED! Check the error messages above.
    pause
)
