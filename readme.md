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
pkgconf xmonad xmonad-contrib xmonad-extras \
git openssh polybar thunar mc ttf-fira-code ttf-hack dmenu

sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
sudo systemctl enable lightdm.service --force

# Configure lightdm for xmonad
sudo tee /usr/share/xsessions/xmonad.desktop <<EOF
[Desktop Entry]
Name=Xmonad
Comment=This session logs you into Xmonad
Exec=xmonad
Type=Application
EOF
```

## Fedora
``` sh
# Install packages
sudo dnf install \
git \
libX11-devel libXft-devel libXinerama-devel libXrandr-devel libXScrnSaver-devel xorg-x11-server-Xorg

# Lightdm and Xmonad
sudo dnf install xmonad lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service --force

# Configure lightdm for xmonad
sudo tee /usr/share/xsessions/xmonad.desktop <<EOF
[Desktop Entry]
Name=Xmonad
Comment=This session logs you into Xmonad
Exec=xmonad
Type=Application
EOF
```