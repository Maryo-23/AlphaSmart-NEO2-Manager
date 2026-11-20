#!/bin/bash
# Install AlphaSmart NEO 2 Linux Manager
# Run this script to install all tools

set -e

echo "=== AlphaSmart NEO 2 Linux Manager Installer ==="
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then
   echo "Please run as your regular user (not root)"
   exit 1
fi

# Install system dependencies
echo "Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y libreoffice python3-pip zenity python3-tk pandoc

# Install neotools
echo "Installing neotools..."
pip3 install --user neotools || pip3 install --user --break-system-packages neotools

# Also link neotools at the legacy venv path that older scripts expect
mkdir -p ~/.local/neotools-venv/bin
ln -sf "$HOME/.local/bin/neotools" ~/.local/neotools-venv/bin/neotools

# Create directories
mkdir -p ~/.local/bin
mkdir -p ~/Desktop
mkdir -p ~/Documents

# Install udev rules
echo "Setting up udev rules for NEO 2..."
sudo tee /lib/udev/rules.d/50-alphasmart.rules << 'EOF'
ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="081e", ATTRS{idProduct}=="bd01", MODE="660", GROUP="plugdev"
ACTION=="add", SUBSYSTEMS=="usb", ATTRS{idVendor}=="081e", ATTRS{idProduct}=="bd04", MODE="660", GROUP="plugdev"
EOF

# Add user to plugdev
sudo usermod -aG plugdev $USER

# Reload udev rules
sudo udevadm control --reload-rules
sudo udevadm trigger

# Copy scripts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Installing scripts..."
cp "$SCRIPT_DIR/scripts/"* ~/.local/bin/
chmod +x ~/.local/bin/neo-*
chmod +x ~/.local/bin/fix-my-doc
chmod +x ~/.local/bin/send-to-neo
chmod +x ~/.local/bin/neo-sender-gui

# Copy desktop files
echo "Installing desktop icons..."
cp "$SCRIPT_DIR/desktop/"*.desktop ~/Desktop/
chmod +x ~/Desktop/*.desktop

# Create NEO_Files directory
mkdir -p ~/NEO_Files

echo ""
echo "=== Installation Complete ==="
echo ""
echo "You may need to log out and back in for group changes to take effect."
echo ""
echo "Desktop icons installed:"
echo "  - NEO Sender (send files TO the NEO)"
echo "  - NEO Import (receive files FROM the NEO)"
echo "  - Fix My Doc (format and fix grammar)"
echo ""
echo "If you need to reload without logging out:"
echo "  newgrp plugdev"
echo ""
echo "Press Enter to exit..."
read
