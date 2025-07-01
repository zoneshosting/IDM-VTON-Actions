@echo off
echo.
echo ===============================================
echo   IDM-VTON Frontend Deployment Script
echo ===============================================
echo.

:: Change to the project directory
cd /d "D:\00 Github\IDM-VirtualTryOn"

:: Check if we're in the right directory
if not exist "index.html" (
    echo ERROR: index.html not found. Please make sure you're in the correct directory.
    echo Current directory: %CD%
    pause
    exit /b 1
)

echo [1/5] Current directory: %CD%
echo.

:: Check Git status
echo [2/5] Checking Git status...
git status --porcelain > nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This doesn't appear to be a Git repository.
    echo Please run this script from your IDM-VirtualTryOn directory.
    pause
    exit /b 1
)

:: Add all files
echo [3/5] Adding all files to Git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files to Git.
    pause
    exit /b 1
)

echo ✓ Files added successfully
echo.

:: Commit changes
echo [4/5] Committing changes...
git commit -m "feat: add beautiful frontend web UI for virtual try-on

- Create responsive web interface with modern design
- Add drag-and-drop image upload functionality  
- Integrate GitHub Actions workflow triggering
- Include mobile-friendly responsive layout
- Add GitHub Pages deployment workflow
- Update documentation with frontend features
- Provide example images and parameter guidance"

if %errorlevel% neq 0 (
    echo WARNING: Commit failed. This might be because there are no changes to commit.
    echo Continuing with push anyway...
)

echo ✓ Changes committed
echo.

:: Push to GitHub
echo [5/5] Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ERROR: Failed to push to GitHub.
    echo Please check your internet connection and GitHub credentials.
    pause
    exit /b 1
)

echo ✓ Successfully pushed to GitHub!
echo.

:: Success message
echo ===============================================
echo            DEPLOYMENT SUCCESSFUL! 🎉
echo ===============================================
echo.
echo ✅ Frontend files have been deployed to GitHub
echo ✅ GitHub Pages will automatically build your site
echo ✅ Your web interface will be live in 2-3 minutes at:
echo.
echo    🌐 https://zoneshosting.github.io/IDM-VTON-Actions
echo.
echo ===============================================
echo                 NEXT STEPS
echo ===============================================
echo.
echo 1. 🔧 Enable GitHub Pages (if not already enabled):
echo    • Go to: https://github.com/zoneshosting/IDM-VTON-Actions/settings/pages
echo    • Under "Source", select "GitHub Actions"
echo    • Click "Save"
echo.
echo 2. ⏳ Wait 2-3 minutes for deployment to complete
echo.
echo 3. 🌐 Visit your live web interface:
echo    https://zoneshosting.github.io/IDM-VTON-Actions
echo.
echo 4. 🎯 Test the complete workflow:
echo    • Upload or provide image URLs
echo    • Adjust parameters
echo    • Click "Run Virtual Try-On"
echo    • Follow GitHub Actions workflow
echo    • Download results from artifacts
echo.
echo ===============================================
echo.
echo Press any key to open GitHub repository...
pause > nul

:: Open GitHub repository
start https://github.com/zoneshosting/IDM-VTON-Actions

echo.
echo 📱 Want to open the web interface too? (after 3 minutes)
echo Press any key to open web interface, or close this window to exit...
pause > nul

:: Open web interface
start https://zoneshosting.github.io/IDM-VTON-Actions

echo.
echo 🎉 Deployment complete! Enjoy your virtual try-on system!
echo.
pause
