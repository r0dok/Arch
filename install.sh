#!/bin/sh
mkdir Notes
mkdir Tools
mkdir Visuals
Syuu -y
pacman -Syuu -y Discord neofetch steam bashtop 
pacman -Syuu -y asciiquarium

cd
mkdir Tools
cd Tools
git clone https://gitlab.com/jallbrit/cbonsai
cd cbonsai
make install PREFIX=~/.local
make install

cd ../Visuals
git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes
cd

cd Tools/
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh

cd 
pacman -Syuu -y catphish email2phonenumber holehe seeker simpleemailspoofer buster whatsmyname whatbreach twint trape social-vuln-scanner 
pacman -Syuu -y autosint gosint protosint

echo "You are done now, enjoy!"
