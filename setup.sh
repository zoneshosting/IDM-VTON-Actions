#!/bin/bash

# IDM-VTON GitHub Repository Setup Script
# Run this script in the project directory to initialize Git and push to GitHub

echo "🚀 Setting up IDM-VTON Virtual Try-On repository..."

# Initialize Git repository
echo "📦 Initializing Git repository..."
git init

# Add all files
echo "📁 Adding files to Git..."
git add .

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "feat: initial commit - IDM-VTON GitHub Actions implementation

- Add complete GitHub Actions workflow for virtual try-on
- Include comprehensive documentation and examples
- Set up project structure with all necessary files
- Ready for cloud-based virtual try-on processing"

echo ""
echo "✅ Local repository initialized!"
echo ""
echo "📋 Next steps:"
echo "1. Create a new repository on GitHub named 'IDM-VirtualTryOn'"
echo "2. Copy the remote URL from GitHub"
echo "3. Run these commands:"
echo ""
echo "   git remote add origin YOUR_GITHUB_URL"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. Go to your GitHub repository"
echo "5. Navigate to Actions tab"
echo "6. Run your first virtual try-on!"
echo ""
echo "🎉 Happy virtual try-on!"
