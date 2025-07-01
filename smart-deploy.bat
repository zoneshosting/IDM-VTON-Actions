@echo off
chcp 65001 > nul
title IDM-VTON Smart Deploy
echo.
echo [INFO] Smart Deploy - Auto-sync and push
echo =====================================
echo.

:: Change to project directory
cd /d "D:\00 Github\IDM-VirtualTryOn"

:: First, let's sync with remote
echo [1/5] Syncing with remote repository...
git fetch origin
if %errorlevel% neq 0 (
    echo [ERROR] Failed to fetch from remote
    pause
    exit /b 1
)

echo [2/5] Merging remote changes...
git pull origin main --no-edit
if %errorlevel% neq 0 (
    echo [WARNING] Pull had conflicts or issues, trying rebase...
    git pull origin main --rebase
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to sync with remote. Manual intervention needed.
        echo Please check for conflicts and run: git status
        pause
        exit /b 1
    fi
)

echo [3/5] Adding local changes...
git add .
if %errorlevel% neq 0 (
    echo [ERROR] Failed to add files
    pause
    exit /b 1
)

echo [4/5] Committing changes...
git commit -m "fix: Load Example Images button functionality and improve UI"
if %errorlevel% neq 0 (
    echo [INFO] No new changes to commit, or commit failed
)

echo [5/5] Pushing to GitHub...
git push origin main
if %errorlevel% equ 0 (
    echo.
    echo [SUCCESS] Fix deployed successfully!
    echo ========================================
    echo.
    echo [OK] Changes pushed to GitHub
    echo [OK] GitHub Pages will update in 1-2 minutes
    echo [OK] Web interface: https://zoneshosting.github.io/IDM-VTON-Actions
    echo.
    echo What was fixed:
    echo   - Load Example Images button now works properly
    echo   - Better error handling and user feedback
    echo   - Improved visual indicators when URLs load
    echo   - Console debugging for troubleshooting
    echo.
    echo Wait 2 minutes, then test the button!
    echo.
    timeout /t 3 /nobreak > nul
    start https://zoneshosting.github.io/IDM-VTON-Actions
) else (
    echo.
    echo [ERROR] Push failed. Error details above.
    echo.
    echo Common solutions:
    echo 1. Check internet connection
    echo 2. Verify GitHub credentials
    echo 3. Try running this script again
    echo.
    pause
)
