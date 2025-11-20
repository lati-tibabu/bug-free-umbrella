# Customization Examples - Odoo 16 Backend Theme

This guide provides practical examples for customizing the backend theme to match your brand or preferences.

## Color Scheme Customization

### Example 1: Corporate Blue Theme

Edit `static/src/scss/variables.scss`:

```scss
// Corporate Blue Color Scheme
$o-brand-primary: #003366;      // Dark Navy
$o-brand-secondary: #0066CC;    // Corporate Blue
$o-brand-accent: #FF6600;       // Orange Accent
$o-brand-success: #00AA66;      // Green
$o-brand-warning: #FFAA00;      // Amber
$o-brand-danger: #CC0000;       // Red

// Backgrounds
$o-bg-sidebar: #003366;
$o-bg-navbar: #004080;
```

### Example 2: Modern Dark Theme

```scss
// Modern Dark Color Scheme
$o-brand-primary: #1E1E1E;      // Dark Gray
$o-brand-secondary: #00D4FF;    // Cyan
$o-brand-accent: #FF00E5;       // Magenta
$o-brand-success: #00FF88;      // Mint Green
$o-brand-warning: #FFD700;      // Gold
$o-brand-danger: #FF3366;       // Pink Red

// Dark backgrounds
$o-bg-sidebar: #1E1E1E;
$o-bg-navbar: #2A2A2A;
$o-bg-light: #2E2E2E;
$o-bg-dark: #1A1A1A;
```

### Example 3: Minimalist Light Theme

```scss
// Minimalist Light Color Scheme
$o-brand-primary: #333333;      // Charcoal
$o-brand-secondary: #4A90E2;    // Sky Blue
$o-brand-accent: #F5A623;       // Gold
$o-brand-success: #7ED321;      // Lime Green
$o-brand-warning: #F8E71C;      // Yellow
$o-brand-danger: #D0021B;       // Bright Red

// Light backgrounds
$o-bg-sidebar: #F8F9FA;
$o-bg-navbar: #FFFFFF;
$o-border-color: #E0E0E0;
```

## Component Customization Examples

### Example 4: Rounded Buttons

Edit `static/src/scss/buttons.scss`:

```scss
// Make buttons fully rounded
.btn {
    border-radius: 24px;  // Increase from default 4px
    padding: 10px 24px;   // Adjust padding
}
```

### Example 5: Larger Sidebar

Edit `static/src/scss/sidebar.scss`:

```scss
// Increase sidebar width
$o-sidebar-width: 300px;  // Changed from 250px

.o_main_navbar {
    .o_menu_sections {
        .o_nav_entry {
            padding: 12px 20px;  // More padding
            font-size: 15px;     // Larger font
        }
    }
}
```

### Example 6: Compact Navbar

Edit `static/src/scss/navbar.scss`:

```scss
// Reduce navbar height
$o-navbar-height: 48px;  // Reduced from 56px

.o_navbar {
    height: $o-navbar-height;
    padding: 0 12px;  // Reduce padding
}
```

### Example 7: Card-Style Kanban

Edit `static/src/scss/kanban.scss`:

```scss
// Enhanced card styling
.o_kanban_view {
    .o_kanban_record {
        border-radius: 12px;  // More rounded
        padding: 20px;        // More padding
        
        &:hover {
            transform: translateY(-4px) scale(1.02);  // More dramatic hover
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }
    }
}
```

### Example 8: Gradient Headers

Edit `static/src/scss/forms.scss`:

```scss
// Add gradient to form status bar
.o_form_statusbar {
    background: linear-gradient(
        135deg,
        $o-brand-primary,
        $o-brand-secondary
    );
    color: white;
    
    .o_statusbar_status {
        .o_arrow_button {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            
            &.btn-primary {
                background-color: rgba(255, 255, 255, 0.3);
            }
        }
    }
}
```

## Advanced Customization

### Example 9: Custom Sidebar Icons

Edit `static/src/scss/sidebar.scss`:

```scss
// Add custom icons with colors
.o_main_navbar {
    .o_menu_sections {
        .o_nav_entry {
            i {
                width: 24px;
                text-align: center;
                margin-right: 12px;
                
                // Color code by menu type
                &.fa-dashboard { color: #3498DB; }
                &.fa-shopping-cart { color: #27AE60; }
                &.fa-users { color: #E74C3C; }
                &.fa-cog { color: #95A5A6; }
            }
        }
    }
}
```

### Example 10: Animated Hover Effects

Edit `static/src/scss/theme.scss`:

```scss
// Add smooth animations
.o_list_view {
    .o_list_table {
        tbody {
            tr {
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                
                &:hover {
                    transform: translateX(4px);
                    background-color: lighten($o-brand-secondary, 45%);
                    box-shadow: -4px 0 0 0 $o-brand-secondary;
                }
            }
        }
    }
}
```

### Example 11: Custom Scrollbar

Edit `static/src/scss/theme.scss`:

```scss
// Customize scrollbar
::-webkit-scrollbar {
    width: 12px;
    height: 12px;
}

::-webkit-scrollbar-track {
    background-color: $o-bg-light;
    border-radius: 6px;
}

::-webkit-scrollbar-thumb {
    background: linear-gradient(
        180deg,
        $o-brand-primary,
        $o-brand-secondary
    );
    border-radius: 6px;
    border: 2px solid $o-bg-light;
    
    &:hover {
        background: $o-brand-secondary;
    }
}
```

### Example 12: Badge Styles

Edit `static/src/scss/theme.scss`:

```scss
// Enhance badge styling
.badge {
    border-radius: 12px;
    padding: 6px 12px;
    font-weight: 600;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    
    &.badge-primary {
        background: linear-gradient(135deg, $o-brand-primary, darken($o-brand-primary, 10%));
        box-shadow: 0 2px 4px rgba($o-brand-primary, 0.3);
    }
}
```

## Typography Customization

### Example 13: Custom Font

Edit `static/src/scss/variables.scss`:

```scss
// Use custom font family
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

$o-font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
$o-font-size-base: 14px;
$o-font-size-sm: 12px;
$o-font-size-lg: 16px;
$o-font-size-xl: 18px;
```

### Example 14: Enhanced Typography Scale

```scss
// Better typography hierarchy
body {
    font-family: $o-font-family;
    font-size: $o-font-size-base;
    line-height: 1.6;
    letter-spacing: -0.01em;
}

h1, h2, h3, h4, h5, h6 {
    font-weight: $o-font-weight-bold;
    line-height: 1.2;
    margin-bottom: $o-spacing-md;
}

h1 { font-size: 32px; }
h2 { font-size: 24px; }
h3 { font-size: 20px; }
h4 { font-size: 18px; }
```

## Layout Customization

### Example 15: Wide Form Layout

Edit `static/src/scss/forms.scss`:

```scss
// Increase form width
.o_form_view {
    .o_form_sheet {
        max-width: 1400px;  // Increased from 1200px
        padding: 40px;       // More padding
    }
}
```

### Example 16: Compact List View

Edit `static/src/scss/theme.scss`:

```scss
// Reduce list view spacing
.o_list_view {
    .o_list_table {
        thead th,
        tbody td {
            padding: 8px 12px;  // Reduced padding
            font-size: 13px;     // Smaller font
        }
    }
}
```

## Creating Component Variants

### Example 17: Success Button Variant

Edit `static/src/scss/buttons.scss`:

```scss
// Create a new success button style
.btn-success-outline {
    background-color: transparent;
    border: 2px solid $o-brand-success;
    color: $o-brand-success;
    
    &:hover {
        background-color: $o-brand-success;
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba($o-brand-success, 0.3);
    }
}
```

### Example 18: Info Card Style

Edit `static/src/scss/theme.scss`:

```scss
// Create info card component
.card-info {
    background: linear-gradient(135deg, 
        lighten($o-brand-info, 45%), 
        lighten($o-brand-info, 40%)
    );
    border-left: 4px solid $o-brand-info;
    padding: $o-spacing-md;
    border-radius: $o-border-radius;
    margin-bottom: $o-spacing-md;
    
    .card-info-title {
        font-weight: $o-font-weight-bold;
        color: darken($o-brand-info, 20%);
        margin-bottom: $o-spacing-xs;
    }
}
```

## Responsive Customization

### Example 19: Mobile-Optimized Kanban

Edit `static/src/scss/kanban.scss`:

```scss
// Better mobile kanban
@media (max-width: 768px) {
    .o_kanban_view {
        padding: $o-spacing-sm;
        
        .o_kanban_record {
            padding: $o-spacing-sm;
            margin-bottom: $o-spacing-sm;
            
            .o_kanban_record_title {
                font-size: 15px;
            }
        }
    }
}
```

### Example 20: Tablet Layout

```scss
// Optimize for tablets
@media (min-width: 768px) and (max-width: 1024px) {
    .o_form_sheet {
        max-width: 100%;
        padding: $o-spacing-md;
    }
    
    .o_main_navbar {
        width: 200px;  // Narrower sidebar on tablets
    }
}
```

## Testing Your Customizations

After making changes:

1. **Upgrade the module:**
   ```bash
   ./odoo-bin -c odoo.conf -d your_database -u backend_theme_custom
   ```

2. **Clear browser cache:** Ctrl+F5 (Windows/Linux) or Cmd+Shift+R (Mac)

3. **Use browser DevTools:**
   - Right-click > Inspect
   - Check Console for errors
   - Verify CSS is applied

4. **Test on different views:**
   - List view
   - Form view
   - Kanban view
   - Calendar view
   - Dashboard

## Best Practices

1. **Always use variables** instead of hardcoded values
2. **Test on multiple browsers** (Chrome, Firefox, Safari, Edge)
3. **Verify mobile responsiveness**
4. **Check color contrast** for accessibility
5. **Keep animations subtle** (200-300ms)
6. **Use consistent spacing** from the spacing scale
7. **Document your changes** for future reference

## Reverting Changes

To revert to default styles:

1. Restore original SCSS files from version control
2. Or comment out specific customizations
3. Upgrade the module again

```bash
git checkout -- static/src/scss/
./odoo-bin -c odoo.conf -d your_database -u backend_theme_custom
```

---

**Need Help?** Check the TECHNICAL.md file for advanced topics or the main README.md for general information.
