@echo off
title IDM-VTON Fix Deploy
echo.
echo 🔧 Deploying fix for "Load Example Images" button...
echo.

:: Change to project directory
cd /d "D:\00 Github\IDM-VirtualTryOn"

:: Quick git add, commit, and push
echo Adding files...
git add index.html

echo Committing fix...
git commit -m "fix: Load Example Images button not working

- Add proper event listeners and error handling
- Improve button functionality and user feedback  
- Add console logging for debugging
- Fix JavaScript initialization issues"

echo Pushing to GitHub...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ SUCCESS! Fix deployed to GitHub
    echo 🌐 Web interface: https://zoneshosting.github.io/IDM-VTON-Actions
    echo.
    echo The fix includes:
    echo ✓ Better event listener setup
    echo ✓ Improved error handling  
    echo ✓ Visual feedback when URLs load
    echo ✓ Console logging for debugging
    echo.
    echo Wait 1-2 minutes for GitHub Pages to update, then test again!
    echo.
    timeout /t 3 /nobreak > nul
    start https://zoneshosting.github.io/IDM-VTON-Actions
) else (
    echo.
    echo ❌ FAILED! Check the error messages above.
    pause
)
