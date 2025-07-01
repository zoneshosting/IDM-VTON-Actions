# PowerShell script to fix line endings (CRLF to LF)
# Run this on Windows to ensure all files use LF line endings

Write-Host "🔧 Fixing line endings (CRLF → LF) for all files..." -ForegroundColor Green

# Function to convert line endings
function Fix-LineEndings {
    param([string]$FilePath)
    
    if (Test-Path $FilePath) {
        $content = Get-Content -Path $FilePath -Raw
        if ($content) {
            # Replace CRLF with LF
            $content = $content -replace "`r`n", "`n"
            # Remove any remaining CR
            $content = $content -replace "`r", ""
            
            # Write back with UTF8 encoding and LF line endings
            [System.IO.File]::WriteAllText($FilePath, $content, [System.Text.UTF8Encoding]::new($false))
            Write-Host "✓ Fixed: $FilePath" -ForegroundColor Cyan
        }
    }
}

# File patterns to fix
$patterns = @("*.yml", "*.yaml", "*.md", "*.txt", "*.sh", "*.py", "*.json")

# Find and fix all matching files
foreach ($pattern in $patterns) {
    Get-ChildItem -Recurse -Filter $pattern | ForEach-Object {
        Fix-LineEndings -FilePath $_.FullName
    }
}

# Fix specific files
$specificFiles = @(".gitignore", ".gitattributes", "LICENSE")
foreach ($file in $specificFiles) {
    if (Test-Path $file) {
        Fix-LineEndings -FilePath (Resolve-Path $file).Path
    }
}

Write-Host ""
Write-Host "✅ All line endings fixed!" -ForegroundColor Green
Write-Host "💡 All files now use LF line endings (Unix/Linux standard)" -ForegroundColor Yellow
Write-Host ""
Write-Host "🔄 Next steps:" -ForegroundColor Cyan
Write-Host "1. Add and commit the changes:"
Write-Host "   git add ."
Write-Host "   git commit -m 'fix: convert line endings from CRLF to LF'"
Write-Host "2. Push to GitHub:"
Write-Host "   git push"
