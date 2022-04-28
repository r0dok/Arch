#!/bin/bash

AUDIO_SRC='https://www.youtube.com/watch?v=5Z5qYOuc1dE'
AUDIO_DST='~/ara_ara.mp3'

# Ara_ara.mp3:
yes | pacman -S youtube-dl mpv
youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output
"${AUDIO_DST}" --no-playlist "${AUDIO_SRC}"
mpv "${AUDIO_DST}"

# Regular tools:
yes | pacman -Syyu
yes | pacman -S discord neofetch steam bashtop asciiquarium

# bonsai:
mkdir ~/{Notes,Tools,Visuals}
git clone https://gitlab.com/jallbrit/cbonsai ~/Tools/
cd ~/Tools/cbonsai/
make install PREFIX=~/.local
make install

# GUI themes:
git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes

# Blackarch:
cd Tools/
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
yes | pacman -S catphish email2phonenumber holehe seeker simpleemailspoofer buster whatsmyname whatbreach twint
trape social-vuln-scanner

# Setting up audio:
amixer set Master on
amixer set Master 50%

# Greetings.mp3:
AUDIO_SRC='https://www.youtube.com/watch?v=kOKneP3tH90'
AUDIO_DST='~/greetings_master.mp3'
youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output
"${AUDIO_DST}" --no-playlist "${AUDIO_SRC}"
mpv "${AUDIO_DST}"

echo "You are done now, enjoy!"
