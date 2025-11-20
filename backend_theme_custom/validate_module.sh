#!/bin/bash
# Module Validation Script for Odoo 16 Backend Theme

echo "================================================"
echo "Odoo 16 Backend Theme - Module Validation"
echo "================================================"
echo ""

MODULE_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$MODULE_PATH"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0

# Function to print test result
test_result() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✓ PASS${NC}: $2"
        ((PASSED++))
    else
        echo -e "${RED}✗ FAIL${NC}: $2"
        ((FAILED++))
    fi
}

# 1. Check required files exist
echo "1. Checking required files..."
[ -f "__init__.py" ]; test_result $? "__init__.py exists"
[ -f "__manifest__.py" ]; test_result $? "__manifest__.py exists"
[ -f "README.md" ]; test_result $? "README.md exists"
[ -f "views/webclient_templates.xml" ]; test_result $? "views/webclient_templates.xml exists"
echo ""

# 2. Check SCSS files
echo "2. Checking SCSS files..."
[ -f "static/src/scss/variables.scss" ]; test_result $? "variables.scss exists"
[ -f "static/src/scss/sidebar.scss" ]; test_result $? "sidebar.scss exists"
[ -f "static/src/scss/navbar.scss" ]; test_result $? "navbar.scss exists"
[ -f "static/src/scss/buttons.scss" ]; test_result $? "buttons.scss exists"
[ -f "static/src/scss/forms.scss" ]; test_result $? "forms.scss exists"
[ -f "static/src/scss/kanban.scss" ]; test_result $? "kanban.scss exists"
[ -f "static/src/scss/theme.scss" ]; test_result $? "theme.scss exists"
echo ""

# 3. Check Python syntax
echo "3. Validating Python syntax..."
if command -v python3 &> /dev/null; then
    python3 -m py_compile __init__.py 2>/dev/null
    test_result $? "__init__.py syntax valid"
    
    python3 -m py_compile __manifest__.py 2>/dev/null
    test_result $? "__manifest__.py syntax valid"
else
    echo -e "${YELLOW}⚠ WARNING${NC}: Python3 not found, skipping syntax check"
fi
echo ""

# 4. Check manifest structure
echo "4. Validating __manifest__.py structure..."
if grep -q "'name'" __manifest__.py; then
    test_result 0 "Manifest contains 'name'"
else
    test_result 1 "Manifest contains 'name'"
fi

if grep -q "'version'" __manifest__.py; then
    test_result 0 "Manifest contains 'version'"
else
    test_result 1 "Manifest contains 'version'"
fi

if grep -q "'depends'" __manifest__.py; then
    test_result 0 "Manifest contains 'depends'"
else
    test_result 1 "Manifest contains 'depends'"
fi

if grep -q "'assets'" __manifest__.py; then
    test_result 0 "Manifest contains 'assets'"
else
    test_result 1 "Manifest contains 'assets'"
fi
echo ""

# 5. Check asset paths
echo "5. Validating asset paths in manifest..."
ASSET_ERRORS=0
while IFS= read -r line; do
    if [[ $line =~ \'([^\']+\.scss)\' ]]; then
        ASSET_PATH="${BASH_REMATCH[1]}"
        # Remove module prefix (e.g., backend_theme_custom/) to get relative path
        ASSET_FILE="${ASSET_PATH#backend_theme_custom/}"
        if [ -f "$ASSET_FILE" ]; then
            test_result 0 "Asset file exists: $ASSET_FILE"
        else
            test_result 1 "Asset file missing: $ASSET_FILE"
            ((ASSET_ERRORS++))
        fi
    fi
done < <(grep "\.scss" __manifest__.py)

if [ $ASSET_ERRORS -eq 0 ] && grep -q "\.scss" __manifest__.py; then
    echo -e "${GREEN}All SCSS asset paths are valid${NC}"
fi
echo ""

# 6. Check XML structure
echo "6. Checking XML files..."
if command -v xmllint &> /dev/null; then
    xmllint --noout views/webclient_templates.xml 2>/dev/null
    test_result $? "webclient_templates.xml is valid XML"
else
    if grep -q "<?xml" views/webclient_templates.xml && grep -q "</odoo>" views/webclient_templates.xml; then
        test_result 0 "webclient_templates.xml has XML structure"
    else
        test_result 1 "webclient_templates.xml has XML structure"
    fi
fi
echo ""

# 7. Check directory structure
echo "7. Validating directory structure..."
[ -d "static/src/scss" ]; test_result $? "static/src/scss directory exists"
[ -d "static/description" ]; test_result $? "static/description directory exists"
[ -d "views" ]; test_result $? "views directory exists"
[ -d "security" ]; test_result $? "security directory exists"
echo ""

# 8. Check file permissions (Unix-like systems)
if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "darwin"* ]]; then
    echo "8. Checking file permissions..."
    
    # Check if files are readable
    for file in __init__.py __manifest__.py views/webclient_templates.xml; do
        if [ -r "$file" ]; then
            test_result 0 "$file is readable"
        else
            test_result 1 "$file is readable"
        fi
    done
    echo ""
fi

# 9. Check for common issues
echo "9. Checking for common issues..."

# Check for trailing whitespace in Python files
if grep -q "[[:space:]]$" __manifest__.py 2>/dev/null; then
    echo -e "${YELLOW}⚠ WARNING${NC}: Trailing whitespace found in __manifest__.py"
else
    test_result 0 "No trailing whitespace in __manifest__.py"
fi

# Check for DOS line endings
if file __manifest__.py | grep -q "CRLF"; then
    echo -e "${YELLOW}⚠ WARNING${NC}: DOS line endings found in __manifest__.py"
else
    test_result 0 "Unix line endings in __manifest__.py"
fi
echo ""

# 10. Summary
echo "================================================"
echo "Validation Summary"
echo "================================================"
echo -e "${GREEN}Passed${NC}: $PASSED"
echo -e "${RED}Failed${NC}: $FAILED"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed! Module is ready for installation.${NC}"
    exit 0
else
    echo -e "${RED}✗ Some checks failed. Please review the errors above.${NC}"
    exit 1
fi
