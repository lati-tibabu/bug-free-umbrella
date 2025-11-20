# Custom Backend Theme for Odoo 16

A modern, professional backend theme for Odoo 16 with enhanced UI components and customizable styling.

## Features

✨ **Complete Theme Customization**
- Custom color scheme with modern palette
- Redesigned sidebar navigation with smooth transitions
- Enhanced navbar with better visual hierarchy
- Professional button styles with hover effects
- Improved form view layouts
- Modern kanban card designs

🎨 **Visual Enhancements**
- Smooth animations and transitions
- Consistent border radius and spacing
- Professional shadows and elevation
- Improved typography
- Better color contrast for accessibility

📱 **Responsive Design**
- Mobile-friendly layouts
- Adaptive kanban views
- Responsive form fields

## Installation

### Method 1: Manual Installation

1. **Copy the module to your Odoo addons directory:**
   ```bash
   cp -r backend_theme_custom /path/to/odoo/addons/
   ```

2. **Update the addons list:**
   - Go to Apps menu
   - Click "Update Apps List" (you may need to activate developer mode)

3. **Install the theme:**
   - Search for "Custom Backend Theme"
   - Click "Install"

### Method 2: Using Custom Addons Path

1. **Add the module directory to your Odoo configuration:**
   ```ini
   [options]
   addons_path = /path/to/odoo/addons,/path/to/backend_theme_custom
   ```

2. **Restart Odoo server:**
   ```bash
   ./odoo-bin -c /path/to/odoo.conf
   ```

3. **Install the module as described above**

## Module Structure

```
backend_theme_custom/
├── __init__.py                          # Module initialization
├── __manifest__.py                      # Module manifest with metadata
├── views/
│   └── webclient_templates.xml         # XML layout overrides
├── static/
│   ├── description/
│   │   ├── banner.png                  # Module banner (optional)
│   │   └── icon.png                    # Module icon (optional)
│   └── src/
│       └── scss/
│           ├── variables.scss          # Theme variables and colors
│           ├── sidebar.scss            # Sidebar navigation styles
│           ├── navbar.scss             # Top navbar styles
│           ├── buttons.scss            # Button component styles
│           ├── forms.scss              # Form view styles
│           ├── kanban.scss             # Kanban view styles
│           └── theme.scss              # Main theme and global styles
├── security/
│   └── ir.model.access.csv            # Access rights (if needed)
└── README.md                           # This file
```

## Customization

### Changing Colors

Edit `static/src/scss/variables.scss` to customize the color scheme:

```scss
// Primary Color Scheme
$o-brand-primary: #2C3E50;    // Main brand color
$o-brand-secondary: #3498DB;  // Secondary accent color
$o-brand-accent: #E74C3C;     // Accent color
$o-brand-success: #27AE60;    // Success state color
$o-brand-warning: #F39C12;    // Warning state color
$o-brand-danger: #E74C3C;     // Danger state color
```

### Customizing Components

Each SCSS file focuses on a specific component:

- **variables.scss**: Global variables, colors, spacing, typography
- **sidebar.scss**: Left navigation sidebar styling
- **navbar.scss**: Top navigation bar and breadcrumbs
- **buttons.scss**: All button variants and states
- **forms.scss**: Form views, fields, labels, inputs
- **kanban.scss**: Kanban views and cards
- **theme.scss**: General theme styles, lists, modals, etc.

### Adding Custom Styles

To add your own custom styles:

1. Create a new SCSS file in `static/src/scss/`
2. Add it to the assets bundle in `__manifest__.py`:

```python
'assets': {
    'web.assets_backend': [
        # ... existing files
        'backend_theme_custom/static/src/scss/your_custom_file.scss',
    ],
},
```

## Dependencies

- **web**: Odoo base web module
- **web_enterprise**: Odoo Enterprise web features (required for full functionality)

> **Note**: This theme is designed for Odoo 16 Enterprise. Some features may not work correctly with Community Edition.

## Compatibility

- **Odoo Version**: 16.0
- **Edition**: Enterprise (recommended), Community (limited support)
- **Browser Support**: Modern browsers (Chrome, Firefox, Safari, Edge)

## Assets Structure

The theme uses Odoo 16's asset bundle system:

```python
'assets': {
    'web.assets_backend': [
        # Loaded in order:
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

## Troubleshooting

### Theme not applying after installation

1. **Clear browser cache**: Press Ctrl+F5 or Cmd+Shift+R
2. **Restart Odoo**: Restart the Odoo server
3. **Update assets**: Go to Settings > Technical > User Interface > Views, search for assets, and click "Regenerate Assets"

### Styles conflict with other modules

If you have other theme modules installed, they may conflict. Try:
1. Uninstall other theme modules
2. Check the load order in `__manifest__.py`
3. Adjust CSS specificity in the SCSS files

### Missing styles in Community Edition

Some Enterprise-specific components may not be styled correctly. Consider:
1. Using Odoo Enterprise for full compatibility
2. Modifying the SCSS to target Community Edition components
3. Removing `web_enterprise` dependency (may cause issues)

## Development

### Prerequisites

- Odoo 16 development environment
- Basic knowledge of SCSS/CSS
- Understanding of Odoo module structure

### Making Changes

1. **Edit SCSS files** in `static/src/scss/`
2. **Upgrade the module** to reload assets:
   ```bash
   ./odoo-bin -c odoo.conf -u backend_theme_custom
   ```
3. **Clear browser cache** to see changes
4. **Use browser DevTools** to inspect and debug styles

### Best Practices

- Use variables for colors and spacing
- Follow BEM naming convention where applicable
- Keep selectors specific but not overly complex
- Test on different screen sizes
- Ensure accessibility (color contrast, keyboard navigation)

## License

LGPL-3 - See Odoo license for details

## Support

For issues, questions, or contributions:
- Create an issue in the repository
- Contact your Odoo implementation partner
- Refer to Odoo documentation: https://www.odoo.com/documentation/16.0/

## Credits

Developed with ❤️ for the Odoo community

## Changelog

### Version 16.0.1.0.0
- Initial release
- Complete backend theme with all major components
- SCSS-based customization system
- Responsive design support
- Modern color scheme and UI enhancements
