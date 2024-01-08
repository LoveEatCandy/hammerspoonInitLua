Hammerspoon init file
====================

# features
This is the Hammerspoon init file for auto turn on or off the sleep feature of MacOS.
- When AC power is connected, sleep is disabled, and system will never sleep even if lid is closed.
- When AC power is disconnected, sleep is enabled.

# how to use
1. Use `sudo visudo` write `your-username ALL = (root:root) NOPASSWD:/usr/bin/pmset disablesleep 1,/usr/bin/pmset disablesleep 0` in `/etc/sudoers`, because we need sudo privilege.
2. [Install hammerspoon](https://github.com/Hammerspoon/hammerspoon?tab=readme-ov-file#how-do-i-install-it) and push `init.lua` in `~/.hammerspoon` folder.
3. Start hammerspoon app, and reload config.
