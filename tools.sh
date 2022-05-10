#!/bin/bash

yes | pacman -Syu

#music
yes | pacman -S --needed ffmpeg youtube-dl mpv

# Regular tools:
yes | pacman -S --needed discord neofetch bashtop asciiquarium

#music
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
yes | pacman -S --needed catphish email2phonenumber holehe seeker simpleemailspoofer buster whatsmyname whatbreach twint
trape social-vuln-scanner
