if [[ $EUID > 0 ]]
then
	echo "Please run as root. Exiting."
	exit
fi

pacman -S $(cat de_packages.txt | tr '\n' ' ')

[[ -d ~/.config ]] || mkdir ~/.config
cp -r 'home/.gtkrc-2.0' ~
cp -r 'home/.config' ~

# terminal and nvim in Thunar shortcut
echo "TerminalEmulator=alacritty\nTerminalEmulatorDismissed=true" > ~/.config/xfce3/helpers.rc
[[ -d ~/.local/share/applications ]] || mkdir -p ~/.local/share/applications
cp /usr/share/applications/nvim.desktop ~/.local/share/applications/nvim.desktop
sed -i 's/^Exec=/Exec=exo-open/g' ~/.local/share/applications/nvim.desktop
sed -i 's/^Terminal=/Terminal=false/g' ~/.local/share/applications/nvim.desktop

cp 'home/.xinitrc' ~
