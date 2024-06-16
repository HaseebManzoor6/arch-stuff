
[comment]: # vim: ft=mdnote

Many hurdles overcome when learning Arch.

# Linux Knowledge

## Total Directory Size
`du -h dir`

## Managing Python
System stuff might depend on Python, so be careful when trying
to add other versions.
Use `pyenv`: <https://github.com/pyenv/pyenv>

```
pyenv install 3.11.6
pyenv local 3.11.6
```

## Thunar

### Thumbnails
Install `tumbler`

### Open in Terminal
<https://askubuntu.com/questions/891680/xubuntu-thunar-open-terminal-here-opens-konsole-in-homefolder>

In `~/.config/xfce3/helpers.rc` (new file):
```
TerminalEmulator=alacritty
TerminalEmulatorDismissed=true
```

### Open in NVIM
First do the above **Open in Terminal** steps

Change the desktop configuration for NVIM, telling it to
run in the terminal.
The system config file is in `/usr/share/applications/nvim.desktop`.
Copy it to `~/.local/share/applications/nvim.desktop` and change:
```
Exec=exo-open --launch TerminalEmulator nvim %F
Terminal=false
```

## Mounting A Windows Partition
> `# mount partition /mnt/windows --mkdir -o ro`

List partitions with `fdisk -l`

# Problems

## Audio
Mic: Install `pulseaudio`, `pulseaudio-alsa`, `alsa-firmware`.

Relevant packages:
```
local/alsa-firmware 1.2.4-3
    Firmware binaries for loader programs in alsa-tools and hotplug firmware loader
local/alsa-lib 1.2.10-2
    An alternative implementation of Linux sound support
local/alsa-plugins 1:1.2.7.1-2
    Additional ALSA plugins
local/alsa-topology-conf 1.2.5.1-3
    ALSA topology configuration files
local/alsa-ucm-conf 1.2.10-2
    ALSA Use Case Manager configuration (and topologies)
local/alsa-utils 1.2.10-1
    Advanced Linux Sound Architecture - Utilities
local/lib32-alsa-lib 1.2.10-2
    An alternative implementation of Linux sound support (32 bit)
local/lib32-alsa-plugins 1.2.7.1-2
    Additional ALSA plugins (32-bit)

local/pulseaudio 16.1-7
    A featureful, general-purpose sound server
local/pulseaudio-alsa 1:1.2.7.1-2
    ALSA Configuration for PulseAudio
```

## Dark Theme for GTK (GNOME) Apps
Install `lxappearance`, `gnome-themes-extra`, and `libadwaita`.
Then run `lxappearance`. Themes should show up including Adwaita
Dark. Reboot may be required. Firefox Downloads`->`show in folder
used to break Thunar dark theme until I set it up from
`lxappearance` and rebooted

## NVIDIA
Current relevant packages (IdeaPad 5):
```
local/lib32-nvidia-utils 545.29.06-1
    NVIDIA drivers utilities (32-bit)
local/libvdpau 1.5-2
    Nvidia VDPAU library
local/libxnvctrl 545.29.06-1
    NVIDIA NV-CONTROL X extension
local/nvidia 545.29.06-7
    NVIDIA drivers for linux
local/nvidia-prime 1.0-4
    NVIDIA Prime Render Offload configuration and utilities
local/nvidia-utils 545.29.06-1
    NVIDIA drivers utilities

local/lib32-mesa 1:23.3.1-1
    An open-source implementation of the OpenGL specification (32-bit)
local/mesa 1:23.3.1-1
    An open-source implementation of the OpenGL specification
local/mesa-utils 9.0.0-3
    Essential Mesa utilities
```
When using `nvidia-prime`, do not use `xf86-video-intel`.
Enable automatically powering down: <https://us.download.nvidia.com/XFree86/Linux-x86_64/525.89.02/README/dynamicpowermanagement.html>

### Crashes During Suspend/Sleep
Enable `nvidia-resume.service` and `nvidia-suspend.service`

## Battery Life
Make sure graphics card is set up right (see above)

Install `tlp` package and:

> `# systemctl enable tlp`

(\# meaning as root)

`tlp` can also limit the maximum battery charge, in the config
file `/etc/tlp.conf`:
```
# don't charge above 80%
STOP_CHARGE_THRESH_BAT0=80
```
On some systems (ideapad) this option has different parameters.
Check with

> `# tlp-stat -b`

On ideapad this option is either 0 or 1, 0 means no threshold, 1
means 90%.

## Laptop Brightness
Tools like `acpilight` (a port of `xbacklight` for laptops)
require permissions on the display device
(i.e. `/sys/class/backlight/intel_backlight/brightness`).
**Solution:** Use udev to create a group with permissions over
the display device. The `video` group exists by default (given
the `filesystem` package) for control over video hardware.

> `# usermod -aG video <user>`

In `/etc/udev/rules.d/backlight.rules` (new file):
```
RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
```

# Customization

## Lock/suspend on close laptop lid
Create `/etc/systemd/longind.conf.d` and a file in there called `myconfig.conf`:
```
[Login]
HandleLidSwitch=suspend
```

For locking, use `xss-lock`. See `man i3lock`.

Trying to do this manually before knowing about `xss-lock`:
In `/usr/lib/systemd/system-sleep`, place an executable shell script.
Test if argument 1 is `pre` or `post`, and you can run scripts before or after
suspending.
See <https://blog.christophersmart.com/2016/05/11/running-scripts-before-and-after-suspend-with-systemd/>
and `man systemd-suspend.service`

## Systray icon customization
<https://askubuntu.com/a/15824>

# Installing Stuff

## TeX Live
See the setup page on their website. It takes a long time.

# Pandoc Test
$$ \sum_{i=1}^n f(x) $$
Inline: $\sum_{i=1}^n f(x)$

- abc
- def
- ghi
