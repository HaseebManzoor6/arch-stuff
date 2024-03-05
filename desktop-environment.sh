pacman -S $(cat de_packages.txt | tr '\n' ' ')
[[ -d ~/.config ]] || mkdir ~/.config
cp -r ./gtk/* ~

# terminal and nvim in Thunar shortcut
echo "TerminalEmulator=alacritty\nTerminalEmulatorDismissed=true" > ~/.config/xfce3/helpers.rc

[[ -d ~/.local/share/applications ]] || mkdir -p ~/.local/share/applications
cp /usr/share/applications/nvim.desktop ~/.local/share/applications/nvim.desktop
sed -i 's/^Exec=/Exec=exo-open' ~/.local/share/applications/nvim.desktop
sed -i 's/^Terminal=/Terminal=false' ~/.local/share/applications/nvim.desktop

cp ./.xinitrc ~
