@echo off
chcp 65001 > nul
title Git Sync and Fix
echo.
echo [INFO] Syncing with GitHub and deploying fix...
echo.

cd /d "D:\00 Github\IDM-VirtualTryOn"

echo Step 1: Fetching latest changes from GitHub...
git fetch origin

echo Step 2: Pulling and merging remote changes...
git pull origin main --no-edit

echo Step 3: Adding your local changes...
git add .

echo Step 4: Committing the fix...
git commit -m "fix: improve Load Example Images button and resolve sync"

echo Step 5: Pushing to GitHub...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo [SUCCESS] All done!
    echo Your fix is now deployed to GitHub Pages
    echo.
    timeout /t 2 /nobreak > nul
    start https://zoneshosting.github.io/IDM-VTON-Actions
) else (
    echo.
    echo [ERROR] Push failed - check output above
    pause
)
