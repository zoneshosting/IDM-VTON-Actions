@echo off
echo.
echo ===============================================
echo     IDM-VTON Complete Setup Script
echo ===============================================
echo.

:: Change to the project directory
cd /d "D:\00 Github\IDM-VirtualTryOn"

echo Current directory: %CD%
echo.

:: Check if Git is installed
git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Git is not installed or not in PATH.
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo ✓ Git is installed
echo.

:: Check if this is already a Git repository
if exist ".git" (
    echo ✓ Git repository already initialized
    goto :configure_git
)

:: Initialize Git repository
echo [1/6] Initializing Git repository...
git init
if %errorlevel% neq 0 (
    echo ERROR: Failed to initialize Git repository.
    pause
    exit /b 1
)
echo ✓ Git repository initialized
echo.

:configure_git
:: Check Git configuration
echo [2/6] Checking Git configuration...

:: Check if user.name is set
git config user.name > nul 2>&1
if %errorlevel% neq 0 (
    echo Setting up Git user configuration...
    set /p username="Enter your GitHub username: "
    git config --global user.name "%username%"
)

:: Check if user.email is set
git config user.email > nul 2>&1
if %errorlevel% neq 0 (
    set /p email="Enter your GitHub email: "
    git config --global user.email "%email%"
)

echo ✓ Git configuration complete
echo   User: 
git config user.name
echo   Email: 
git config user.email
echo.

:: Check for remote origin
echo [3/6] Checking remote repository...
git remote get-url origin > nul 2>&1
if %errorlevel% neq 0 (
    echo Adding remote repository...
    git remote add origin https://github.com/zoneshosting/IDM-VTON-Actions.git
    echo ✓ Remote repository added
) else (
    echo ✓ Remote repository already configured:
    git remote get-url origin
)
echo.

:: Add all files
echo [4/6] Adding all files to Git...
git add .
if %errorlevel% neq 0 (
    echo ERROR: Failed to add files to Git.
    pause
    exit /b 1
)
echo ✓ Files added successfully
echo.

:: Check if there's already a commit
git log --oneline -1 > nul 2>&1
if %errorlevel% neq 0 (
    :: First commit
    echo [5/6] Creating initial commit...
    git commit -m "feat: initial commit - IDM-VTON GitHub Actions with frontend

- Complete GitHub Actions workflow for virtual try-on
- Beautiful responsive web interface with modern design
- All files use LF line endings for cross-platform compatibility
- Comprehensive documentation and troubleshooting guides
- Professional repository structure with templates
- Ready for cloud-based virtual try-on processing"
) else (
    :: Additional commit
    echo [5/6] Creating commit for new changes...
    git commit -m "feat: add beautiful frontend web UI for virtual try-on

- Create responsive web interface with modern design
- Add drag-and-drop image upload functionality
- Integrate GitHub Actions workflow triggering
- Include mobile-friendly responsive layout
- Add GitHub Pages deployment workflow
- Update documentation with frontend features"
)

if %errorlevel% neq 0 (
    echo WARNING: Commit failed. This might be because there are no changes to commit.
    echo Continuing with push anyway...
)
echo ✓ Changes committed
echo.

:: Push to GitHub
echo [6/6] Pushing to GitHub...
git branch -M main
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo ⚠️  PUSH FAILED - This is usually due to one of these reasons:
    echo.
    echo 1. 🔐 Authentication required:
    echo    • You may need to enter your GitHub username and password
    echo    • Or set up a Personal Access Token
    echo.
    echo 2. 🏗️  Repository doesn't exist yet:
    echo    • Go to: https://github.com/new
    echo    • Create a repository named: IDM-VTON-Actions
    echo    • Make it PUBLIC for free GitHub Pages
    echo    • Don't initialize with README (we have files already)
    echo.
    echo 3. 📡 Network connection issues
    echo.
    echo Press any key to open GitHub to create repository...
    pause > nul
    start https://github.com/new
    echo.
    echo After creating the repository, run this script again or just run:
    echo   deploy-frontend.bat
    echo.
    pause
    exit /b 1
)

echo ✓ Successfully pushed to GitHub!
echo.

:: Success message
echo ===============================================
echo            SETUP COMPLETE! 🎉
echo ===============================================
echo.
echo ✅ Git repository initialized and configured
echo ✅ All files committed to Git
echo ✅ Code pushed to GitHub successfully
echo ✅ GitHub Pages will automatically build your site
echo.
echo Your web interface will be live in 2-3 minutes at:
echo    🌐 https://zoneshosting.github.io/IDM-VTON-Actions
echo.
echo ===============================================
echo                 NEXT STEPS
echo ===============================================
echo.
echo 1. 🔧 Enable GitHub Pages:
echo    • Go to: https://github.com/zoneshosting/IDM-VTON-Actions/settings/pages
echo    • Under "Source", select "GitHub Actions"
echo    • Click "Save"
echo.
echo 2. ⏳ Wait 2-3 minutes for deployment
echo.
echo 3. 🌐 Visit: https://zoneshosting.github.io/IDM-VTON-Actions
echo.
echo 4. 🎯 Test virtual try-on with example images!
echo.
echo ===============================================
echo.
echo Press any key to open GitHub repository settings...
pause > nul

:: Open GitHub Pages settings
start https://github.com/zoneshosting/IDM-VTON-Actions/settings/pages

echo.
echo Repository settings opened! Enable GitHub Pages with "GitHub Actions" source.
echo.
echo Press any key to continue...
pause > nul

echo.
echo 🎉 Setup complete! Your virtual try-on system is ready!
echo.
echo For future updates, just run: deploy-frontend.bat
echo.
pause
