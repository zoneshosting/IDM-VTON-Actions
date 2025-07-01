#!/bin/bash

# Script to fix line endings for all files in the repository
# This converts CRLF to LF for all text files

echo "🔧 Fixing line endings (CRLF → LF) for all files..."

# Function to convert line endings
fix_line_endings() {
    local file="$1"
    if [[ -f "$file" ]]; then
        # Convert CRLF to LF using sed
        sed -i 's/\r$//' "$file"
        echo "✓ Fixed: $file"
    fi
}

# Fix specific file types
find . -type f \( -name "*.yml" -o -name "*.yaml" -o -name "*.md" -o -name "*.txt" -o -name "*.sh" -o -name "*.py" -o -name "*.json" \) | while read -r file; do
    fix_line_endings "$file"
done

# Fix specific files
fix_line_endings ".gitignore"
fix_line_endings ".gitattributes"
fix_line_endings "LICENSE"

echo ""
echo "✅ All line endings fixed!"
echo "💡 All files now use LF line endings (Unix/Linux standard)"
echo ""
echo "🔄 Next steps:"
echo "1. Add and commit the changes:"
echo "   git add ."
echo "   git commit -m 'fix: convert line endings from CRLF to LF'"
echo "2. Push to GitHub:"
echo "   git push"
