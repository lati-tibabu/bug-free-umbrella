# Odoo 16 Backend Theme Module

This repository contains a production-ready custom backend theme module for Odoo 16.

## 📦 What's Included

- **Complete Odoo 16 Module**: Ready to install backend theme
- **Full SCSS Customization**: Modern, maintainable stylesheets
- **Component-Based Architecture**: Modular SCSS files for easy customization
- **XML Template Overrides**: QWeb templates for layout modifications
- **Comprehensive Documentation**: Installation, usage, and technical guides

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/lati-tibabu/bug-free-umbrella.git

# Copy to Odoo addons directory
cp -r bug-free-umbrella/backend_theme_custom /path/to/odoo/addons/

# Restart Odoo and install the module
# Go to Apps > Search "Custom Backend Theme" > Install
```

## 📁 Module Structure

```
backend_theme_custom/
├── __init__.py                     # Module initialization
├── __manifest__.py                 # Module manifest with dependencies and assets
├── README.md                       # Module documentation
├── INSTALL.md                      # Detailed installation guide
├── TECHNICAL.md                    # Technical documentation for developers
├── views/
│   └── webclient_templates.xml    # XML template overrides
├── static/
│   ├── description/               # Module images
│   └── src/
│       └── scss/
│           ├── variables.scss     # Theme variables and color scheme
│           ├── sidebar.scss       # Sidebar navigation styles
│           ├── navbar.scss        # Top navbar styles
│           ├── buttons.scss       # Button component styles
│           ├── forms.scss         # Form view styles
│           ├── kanban.scss        # Kanban view styles
│           └── theme.scss         # Global theme styles
└── security/
    └── ir.model.access.csv        # Access rights
```

## ✨ Features

### Color Customization
- Modern, professional color palette
- Customizable primary, secondary, and accent colors
- Success, warning, and danger states

### Enhanced Components
- **Sidebar**: Dark theme with smooth transitions and hover effects
- **Navbar**: Redesigned top navigation with better visual hierarchy
- **Buttons**: Modern button styles with multiple variants
- **Forms**: Improved form layouts with better field styling
- **Kanban**: Beautiful card designs with shadows and animations
- **Lists**: Enhanced table views with hover states

### Design System
- Consistent spacing scale
- Professional typography
- Shadow and elevation system
- Border radius standards
- Responsive design patterns

## 🎨 Customization

All styles are defined using SCSS variables in `static/src/scss/variables.scss`:

```scss
// Customize these colors to match your brand
$o-brand-primary: #2C3E50;
$o-brand-secondary: #3498DB;
$o-brand-accent: #E74C3C;
```

## 📖 Documentation

- **[README.md](backend_theme_custom/README.md)** - Module overview and features
- **[INSTALL.md](backend_theme_custom/INSTALL.md)** - Step-by-step installation guide
- **[TECHNICAL.md](backend_theme_custom/TECHNICAL.md)** - Technical documentation for developers

## 🔧 Requirements

- Odoo 16.0
- Odoo Enterprise (recommended) or Community Edition
- Modern web browser (Chrome, Firefox, Safari, Edge)

## 📝 License

LGPL-3 (Same as Odoo)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## 💡 Support

For questions or issues:
1. Check the documentation in the module folder
2. Review the TECHNICAL.md for advanced topics
3. Open an issue in this repository

## 🌟 Credits

Created for the Odoo community with a focus on modern design and developer experience.

---

**Ready to use in production!** Just copy the `backend_theme_custom` folder to your Odoo addons directory and install.