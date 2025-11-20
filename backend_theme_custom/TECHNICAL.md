# Technical Documentation - Custom Backend Theme

## Architecture Overview

This Odoo 16 backend theme module uses SCSS for styling and XML for template overrides. It follows Odoo's asset bundle system to inject custom styles into the backend interface.

## File Structure

```
backend_theme_custom/
├── __init__.py                 # Python module initialization
├── __manifest__.py             # Module metadata and configuration
├── README.md                   # User documentation
├── INSTALL.md                  # Installation guide
├── TECHNICAL.md               # This file
├── views/
│   └── webclient_templates.xml    # QWeb template overrides
├── static/
│   ├── description/
│   │   ├── banner.png          # Module banner (1200x400px recommended)
│   │   └── icon.png            # Module icon (256x256px recommended)
│   └── src/
│       ├── scss/               # SCSS stylesheets
│       │   ├── variables.scss  # Theme variables and configuration
│       │   ├── sidebar.scss    # Sidebar navigation styles
│       │   ├── navbar.scss     # Top navbar and breadcrumb styles
│       │   ├── buttons.scss    # Button component styles
│       │   ├── forms.scss      # Form view styles
│       │   ├── kanban.scss     # Kanban view styles
│       │   └── theme.scss      # General theme and global styles
│       └── js/                 # JavaScript files (if needed)
└── security/
    └── ir.model.access.csv     # Access rights configuration
```

## Asset Loading System

### Asset Bundle Configuration

In `__manifest__.py`, assets are defined in the `assets` dictionary:

```python
'assets': {
    'web.assets_backend': [
        # Order matters! Load variables first
        'backend_theme_custom/static/src/scss/variables.scss',
        'backend_theme_custom/static/src/scss/sidebar.scss',
        'backend_theme_custom/static/src/scss/navbar.scss',
        'backend_theme_custom/static/src/scss/buttons.scss',
        'backend_theme_custom/static/src/scss/forms.scss',
        'backend_theme_custom/static/src/scss/kanban.scss',
        'backend_theme_custom/static/src/scss/theme.scss',
    ],
},
```

### Loading Order

1. **variables.scss** - Must load first as other files depend on it
2. **Component-specific SCSS** - Each component's styles
3. **theme.scss** - General overrides, loaded last to ensure precedence

## SCSS Architecture

### Variables System

The `variables.scss` file defines the design system:

```scss
// Color Palette
$o-brand-primary: #2C3E50;      // Primary brand color
$o-brand-secondary: #3498DB;    // Secondary accent
$o-brand-success: #27AE60;      // Success states
$o-brand-warning: #F39C12;      // Warning states
$o-brand-danger: #E74C3C;       // Error states

// Spacing Scale
$o-spacing-xs: 4px;
$o-spacing-sm: 8px;
$o-spacing-md: 16px;
$o-spacing-lg: 24px;
$o-spacing-xl: 32px;

// Typography
$o-font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", ...;
$o-font-size-base: 14px;
$o-font-weight-normal: 400;
$o-font-weight-medium: 500;
$o-font-weight-bold: 600;
```

### Component-Specific Files

Each SCSS file targets specific UI components:

#### sidebar.scss
- `.o_main_navbar` - Main navigation sidebar
- `.o_menu_sections` - Menu items container
- `.o_nav_entry` - Individual menu items

#### navbar.scss
- `.o_navbar` - Top navigation bar
- `.o_searchview` - Search functionality
- `.o_menu_systray` - System tray icons

#### buttons.scss
- `.btn` - Base button styles
- `.btn-primary`, `.btn-secondary` - Button variants
- `.btn-outline-*` - Outline button variants

#### forms.scss
- `.o_form_view` - Form container
- `.o_form_statusbar` - Status bar with workflow buttons
- `.o_field_widget` - Individual form fields

#### kanban.scss
- `.o_kanban_view` - Kanban container
- `.o_kanban_group` - Kanban columns
- `.o_kanban_record` - Individual kanban cards

## Customization Guide

### Adding New Colors

1. Define in `variables.scss`:
```scss
$o-brand-custom: #YOUR_COLOR;
```

2. Use in component files:
```scss
.your-component {
    background-color: $o-brand-custom;
}
```

### Overriding Odoo Classes

Target Odoo's existing classes with higher specificity:

```scss
// Override sidebar menu item
.o_main_navbar .o_menu_sections .o_nav_entry {
    // Your custom styles
    color: $o-text-light;
    
    &:hover {
        background-color: $o-sidebar-item-hover;
    }
}
```

### Adding Transitions

Use consistent transition timing:

```scss
.component {
    transition: all 0.2s ease;  // Fast transitions
    // or
    transition: all 0.3s ease;  // Standard transitions
}
```

### Responsive Design

Use media queries for responsive behavior:

```scss
// Desktop-first approach
.component {
    width: 300px;
    
    @media (max-width: 768px) {
        width: 100%;
    }
}
```

## XML Template Overrides

### Webclient Templates

Located in `views/webclient_templates.xml`:

```xml
<!-- Override base webclient -->
<template id="webclient_bootstrap" inherit_id="web.webclient_bootstrap">
    <xpath expr="//body" position="attributes">
        <attribute name="class" add="custom_backend_theme"/>
    </xpath>
</template>
```

### XPath Expressions

Common XPath operations:

```xml
<!-- Add attribute -->
<xpath expr="//element" position="attributes">
    <attribute name="class">new-class</attribute>
</xpath>

<!-- Insert after -->
<xpath expr="//element" position="after">
    <div>New content</div>
</xpath>

<!-- Replace -->
<xpath expr="//element" position="replace">
    <div>Replacement content</div>
</xpath>

<!-- Insert inside -->
<xpath expr="//element" position="inside">
    <div>Inner content</div>
</xpath>
```

## Odoo 16 Specifics

### Asset Bundle System

Odoo 16 uses a new asset bundle system:

- `web.assets_backend` - Backend UI assets
- `web.assets_frontend` - Frontend website assets
- `web.assets_common` - Shared assets

### SCSS Compilation

Odoo compiles SCSS to CSS automatically:
- No build process required
- Changes require module upgrade
- Compiled assets are cached

### Web Enterprise Dependency

The theme depends on `web_enterprise` for:
- Enhanced navigation components
- Enterprise-specific views
- Additional UI elements

To use with Community Edition:
```python
# Remove from __manifest__.py
'depends': [
    'web',
    # 'web_enterprise',  # Comment out
],
```

## Performance Considerations

### Asset Optimization

1. **Minimize CSS Specificity**
   - Avoid deeply nested selectors
   - Use class names efficiently

2. **Reduce Redundancy**
   - Use variables for repeated values
   - Create reusable mixins

3. **Optimize Selectors**
```scss
// Good
.o_kanban_record {
    background: white;
}

// Avoid
div.o_action_manager .o_kanban_view .o_kanban_group .o_kanban_record {
    background: white;
}
```

### Browser Caching

Assets are automatically cached by Odoo:
- Cache busting on module upgrade
- CDN integration possible
- Versioning handled by Odoo

## Debugging

### Browser DevTools

1. **Inspect Elements**
   - Right-click > Inspect
   - Check applied styles
   - Identify which rules override others

2. **Check Loaded Assets**
```javascript
// In browser console
document.querySelectorAll('link[rel="stylesheet"]');
```

3. **Monitor Network Tab**
   - Verify CSS files load
   - Check for 404 errors
   - Inspect file sizes

### Odoo Logs

Check server logs for errors:
```bash
tail -f /var/log/odoo/odoo-server.log
```

### Common Issues

**Styles Not Applying:**
- Clear browser cache (Ctrl+F5)
- Regenerate assets in Odoo
- Check file paths in manifest
- Verify module is installed

**Specificity Conflicts:**
- Increase selector specificity
- Use `!important` as last resort
- Check load order in manifest

## Testing

### Visual Regression Testing

Test on multiple:
- Browsers (Chrome, Firefox, Safari, Edge)
- Screen sizes (Desktop, Tablet, Mobile)
- Odoo views (List, Form, Kanban, Calendar)

### Accessibility Testing

Ensure:
- Color contrast meets WCAG standards
- Keyboard navigation works
- Screen reader compatibility
- Focus indicators are visible

### Cross-Module Compatibility

Test with common modules:
- Inventory
- Sales
- Accounting
- CRM
- HR

## Advanced Customization

### Adding JavaScript

Create JS file in `static/src/js/`:

```javascript
/** @odoo-module **/
import { registry } from "@web/core/registry";

// Your JavaScript code
```

Update manifest:
```python
'assets': {
    'web.assets_backend': [
        # ... SCSS files
        'backend_theme_custom/static/src/js/your_script.js',
    ],
},
```

### Creating Mixins

In `variables.scss`:

```scss
@mixin card-style {
    background: $o-bg-white;
    border-radius: $o-border-radius;
    box-shadow: $o-shadow-sm;
    padding: $o-spacing-md;
}

// Usage
.custom-card {
    @include card-style;
}
```

### Dark Mode Support

Add dark mode variables:

```scss
@media (prefers-color-scheme: dark) {
    body {
        --o-bg-primary: #1a1a1a;
        --o-text-primary: #ffffff;
    }
}
```

## Version Control

### Git Best Practices

```bash
# Ignore compiled assets
echo "static/src/scss/*.css" >> .gitignore

# Track source files
git add static/src/scss/*.scss
git add views/*.xml
git add __manifest__.py
```

### Branching Strategy

- `main` - Stable releases
- `develop` - Active development
- `feature/*` - New features
- `fix/*` - Bug fixes

## Deployment

### Production Checklist

- [ ] Test in staging environment
- [ ] Backup database
- [ ] Verify asset paths
- [ ] Check file permissions
- [ ] Clear CDN cache
- [ ] Monitor error logs
- [ ] Test on target browsers

### Rollback Procedure

```bash
# Uninstall module
./odoo-bin -c odoo.conf -d database -u backend_theme_custom --uninstall

# Or restore from backup
pg_restore -d database backup.sql
```

## Contributing

### Code Style

- Use 4 spaces for indentation
- Follow SCSS-Lint rules
- Comment complex selectors
- Group related properties

### Pull Request Template

```markdown
## Description
[Describe changes]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change

## Testing
- [ ] Tested on Chrome
- [ ] Tested on Firefox
- [ ] Tested on mobile

## Screenshots
[Add screenshots]
```

## Resources

- [Odoo Documentation](https://www.odoo.com/documentation/16.0/)
- [SCSS Documentation](https://sass-lang.com/documentation)
- [QWeb Templates](https://www.odoo.com/documentation/16.0/developer/reference/frontend/qweb.html)
- [Asset Management](https://www.odoo.com/documentation/16.0/developer/reference/frontend/assets.html)

## License

This module is licensed under LGPL-3, consistent with Odoo's licensing.

---

**Last Updated**: 2024
**Odoo Version**: 16.0
**Author**: Your Company
