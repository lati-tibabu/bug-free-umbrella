# -*- coding: utf-8 -*-
{
    'name': 'Custom Backend Theme',
    'version': '16.0.1.0.0',
    'category': 'Themes/Backend',
    'summary': 'Modern custom backend theme for Odoo 16',
    'description': """
        Custom Backend Theme for Odoo 16
        =================================
        
        This module provides a modern, customized backend theme with:
        * Custom color scheme
        * Redesigned sidebar navigation
        * Enhanced navbar styling
        * Custom button styles
        * Improved form view layouts
        * Modern kanban card designs
        
        Features:
        ---------
        - Professional color palette
        - Improved user interface
        - Better visual hierarchy
        - Enhanced readability
        - Modern design patterns
    """,
    'author': 'Your Company',
    'website': 'https://www.yourcompany.com',
    'license': 'LGPL-3',
    'depends': [
        'web',
        'web_enterprise',
    ],
    'data': [
        'views/webclient_templates.xml',
    ],
    'assets': {
        'web.assets_backend': [
            'backend_theme_custom/static/src/scss/variables.scss',
            'backend_theme_custom/static/src/scss/sidebar.scss',
            'backend_theme_custom/static/src/scss/navbar.scss',
            'backend_theme_custom/static/src/scss/buttons.scss',
            'backend_theme_custom/static/src/scss/forms.scss',
            'backend_theme_custom/static/src/scss/kanban.scss',
            'backend_theme_custom/static/src/scss/theme.scss',
        ],
    },
    'images': [
        'static/description/banner.png',
        'static/description/icon.png',
    ],
    'installable': True,
    'application': False,
    'auto_install': False,
}
