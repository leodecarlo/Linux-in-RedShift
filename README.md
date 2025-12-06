# Redshift Toggle Script

A simple script to toggle screen color temperature adjustment using ```redshift```, ideal for reducing eye strain during night hours.

## Features

- Toggles redshift on/off with a preset color temperature (5950K)
- Uses customizable gamma settings (1.00:1.00:1.00)
- Maintains state to remember current mode between sessions
- Provides visual notifications for state changes
- Logs actions for debugging and troubleshooting
- Works with both X11 and Wayland environments

## Installation

### 1. Install redshift

```bash
# For Debian/Ubuntu
sudo apt install redshift

# For Fedora
sudo dnf install redshift

# For Arch
sudo pacman -S redshift
```

### 2. Download the script

```bash
# Make a personal bin folder where you can store custom scripts
mkdir -p ~/.local/bin
wget https://raw.githubusercontent.com/leodecarlo/Linux-in-RedShift/main/toggle-redshift.sh -O ~/.local/bin/toggle-redshift.sh
```

### 3. Make it executable

```bash
chmod +x ~/.local/bin/toggle-redshift.sh
```

## Usage

- Run ```toggle-redshift.sh``` in the terminal to toggle redshift mode
- The script will:
  - Check current redshift state
  - Toggle to the opposite state (on/off)
  - Show notification with current status
  - Log actions to ```~/.cache/toggle-redshift.log```

## Configuration

- Customize the color temperature by editing the ```TEMP``` value in the script (default: 5950K)
- Adjust gamma values by modifying the ```GAMMA``` variable (format: "red:green:blue")
- The script stores state in ```~/.local/state/redshift-contrast.enabled```
- To change the script location, place it in any directory in your PATH (e.g., ```~/.local/bin```, ```/usr/local/bin```)


## Set Up Keyboard Shortcut

- Open *Setting > Keyboard Shortcuts*
- Configure as shown:
    - Name: Redshift
    - Command: /home/user/.local/bin/toggle-redshift.sh
    - Shortcut: Press your desired key combo (e.g., Shift+Ctrl+R)
- Click Add

  
