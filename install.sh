#!/bin/bash

AUDIO_SRC='https://www.youtube.com/watch?v=kOKneP3tH90'
AUDIO_DST='~/greetings_master.mp3'
mkdir ~/{Notes,Tools,Visuals}

yes | pacman -Syyu
yes | pacman -S discord neofetch steam bashtop asciiquarium youtube-dl mpv

git clone https://gitlab.com/jallbrit/cbonsai ~/Tools/
cd ~/Tools/cbonsai/
make install PREFIX=~/.local
make install

git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes

cd Tools/
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh

yes | pacman -S catphish email2phonenumber holehe seeker simpleemailspoofer buster whatsmyname whatbreach twint
trape social-vuln-scanner

# Setting up audio:
amixer set Master on
amixer set Master 50%

# Get and play the audio file:
youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output
"${AUDIO_DST}" --no-playlist "${AUDIO_SRC}"
mpv "${AUDIO_DST}"

echo "You are done now, enjoy!"
