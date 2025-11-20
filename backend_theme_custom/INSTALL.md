# Installation Guide - Custom Backend Theme for Odoo 16

## Quick Start

### Prerequisites
- Odoo 16 installed and running
- Access to the Odoo addons directory
- Administrator access to Odoo instance
- Developer mode enabled (for accessing technical settings)

## Step-by-Step Installation

### 1. Enable Developer Mode

1. Log in to Odoo as administrator
2. Go to **Settings**
3. Scroll to the bottom and click **Activate the developer mode**
   - Or append `?debug=1` to your URL

### 2. Copy Module Files

**Option A: Direct Copy**
```bash
# Copy the entire module to your addons directory
cp -r backend_theme_custom /path/to/odoo/addons/

# Set correct permissions
chmod -R 755 /path/to/odoo/addons/backend_theme_custom
```

**Option B: Symbolic Link**
```bash
# Create a symbolic link if you want to keep the module elsewhere
ln -s /path/to/backend_theme_custom /path/to/odoo/addons/backend_theme_custom
```

**Option C: Custom Addons Path**
```bash
# Add to your Odoo configuration file (odoo.conf)
[options]
addons_path = /usr/lib/python3/dist-packages/odoo/addons,/path/to/custom/addons,/path/to/backend_theme_custom
```

### 3. Update Apps List

1. Go to **Apps** menu
2. Click the **Update Apps List** button
3. In the confirmation dialog, click **Update**
4. Wait for the process to complete

### 4. Install the Theme

1. In the **Apps** menu, remove the "Apps" filter
2. Search for "Custom Backend Theme"
3. Click the **Install** button
4. Wait for installation to complete (usually takes a few seconds)

### 5. Verify Installation

1. Refresh your browser (Ctrl+F5 or Cmd+Shift+R)
2. The theme should now be applied automatically
3. Check that colors, sidebar, and buttons have changed

## Post-Installation

### Clear Assets Cache

If the theme doesn't appear immediately:

```bash
# Option 1: Using Odoo CLI
./odoo-bin -c odoo.conf -d your_database --stop-after-init

# Option 2: Through UI
# Settings > Technical > User Interface > Views
# Search for "assets" and click "Regenerate Assets"
```

### Restart Odoo Server

```bash
# If using service
sudo systemctl restart odoo

# If running manually
# Stop the current process (Ctrl+C) and restart
./odoo-bin -c /path/to/odoo.conf
```

## Updating the Theme

When you make changes to the SCSS files:

### Method 1: Upgrade Module
```bash
./odoo-bin -c odoo.conf -d your_database -u backend_theme_custom
```

### Method 2: Through UI
1. Go to **Apps**
2. Search for "Custom Backend Theme"
3. Click **Upgrade**

### Method 3: Force Asset Regeneration
1. Settings > Technical > User Interface > Views
2. Search for "web.assets_backend"
3. Delete the view or click "Regenerate Assets"

## Uninstallation

### To Remove the Theme:

1. Go to **Apps**
2. Search for "Custom Backend Theme"
3. Click **Uninstall**
4. Confirm the uninstallation
5. Restart Odoo server (optional but recommended)

## Troubleshooting

### Theme Not Appearing

**Solution 1: Clear Browser Cache**
- Chrome: Ctrl+Shift+Delete
- Firefox: Ctrl+Shift+Delete
- Safari: Cmd+Option+E

**Solution 2: Hard Refresh**
- Windows/Linux: Ctrl+F5
- Mac: Cmd+Shift+R

**Solution 3: Check Module Installation**
```bash
# Verify module is in the addons path
ls -la /path/to/odoo/addons/ | grep backend_theme_custom

# Check Odoo logs for errors
tail -f /var/log/odoo/odoo-server.log
```

### Missing Dependencies

If you get an error about missing dependencies:

```bash
# Ensure web_enterprise is installed
# Or remove it from __manifest__.py if using Community Edition
```

### Permission Issues

```bash
# Fix file permissions
sudo chown -R odoo:odoo /path/to/odoo/addons/backend_theme_custom
sudo chmod -R 755 /path/to/odoo/addons/backend_theme_custom
```

### Asset Loading Issues

```python
# In __manifest__.py, verify the asset paths are correct
'assets': {
    'web.assets_backend': [
        'backend_theme_custom/static/src/scss/variables.scss',
        # ... other files
    ],
},
```

## Testing the Installation

### Visual Checklist

After installation, verify these changes:

- [ ] Sidebar has new dark blue color (#2C3E50)
- [ ] Navbar has new color (#34495E)
- [ ] Buttons have rounded corners and hover effects
- [ ] Form fields have new styling with focus states
- [ ] Kanban cards have shadows and hover animations
- [ ] List views have alternating row hover effects
- [ ] Modal dialogs have updated header colors

### Technical Verification

```bash
# Check if assets are loaded
# In browser console:
console.log(document.querySelectorAll('link[href*="backend_theme_custom"]'));

# Should show links to the theme's CSS files
```

## Production Deployment

### For Production Servers:

1. **Test in Staging First**
   - Always test the theme in a staging environment
   - Verify all customizations work as expected

2. **Backup Database**
   ```bash
   pg_dump your_database > backup_$(date +%Y%m%d).sql
   ```

3. **Deploy Module**
   ```bash
   # Copy to production addons
   scp -r backend_theme_custom user@production:/path/to/odoo/addons/
   ```

4. **Install on Production**
   ```bash
   # SSH into production server
   ssh user@production
   
   # Update and install
   ./odoo-bin -c odoo.conf -d your_database -u backend_theme_custom --stop-after-init
   
   # Restart Odoo
   sudo systemctl restart odoo
   ```

5. **Verify Deployment**
   - Clear CDN cache if applicable
   - Test on multiple browsers
   - Check mobile responsiveness

## Docker Installation

If running Odoo in Docker:

```dockerfile
# Add to your Dockerfile
COPY backend_theme_custom /mnt/extra-addons/backend_theme_custom

# Or mount as volume
# docker-compose.yml
volumes:
  - ./backend_theme_custom:/mnt/extra-addons/backend_theme_custom
```

## Additional Resources

- [Odoo Documentation](https://www.odoo.com/documentation/16.0/)
- [Odoo Developer Documentation](https://www.odoo.com/documentation/16.0/developer.html)
- [Odoo Asset Management](https://www.odoo.com/documentation/16.0/developer/reference/frontend/assets.html)

## Support

For installation issues:
1. Check Odoo server logs
2. Verify file permissions
3. Ensure all dependencies are met
4. Clear browser and server cache
5. Contact your system administrator

---

**Installation Complete!** Your Odoo 16 backend should now have the custom theme applied.
