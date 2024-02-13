# Xmonad Configuration

## Xmonad
``` sh
# Install the packages
xmonad xmonad-contrib xmonad-extras polybar feh thunar mc ranger
``` 

## Debian Ubuntu
``` sh
sudo apt install \
git \
libx11-dev libxft-dev libxinerama-dev libxrandr-dev libxss-dev
```

## Archlinux
``` sh
sudo pacman -S \
git \
xorg-server xorg-apps xorg-xinit xorg-xmessage \
libx11 libxft libxinerama libxrandr libxss \
pkgconf
```

## Fedora
``` sh
sudo dnf install \
git \
libX11-devel libXft-devel libXinerama-devel libXrandr-devel libXScrnSaver-devel
```