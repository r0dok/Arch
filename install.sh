#!/bin/bash

USER="$(readlink -f $(whoami) | cut -d '/' -f 3)"
HOMEDIR="/home/${USER}"

AUDIO_SRC='https://www.youtube.com/watch?v=5Z5qYOuc1dE'
AUDIO_DST="${HOMEDIR}/Music/ara_ara.mp3"


# Ara_ara.mp3:
youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output "${AUDIO_DST}" --no-playlist "${AUDIO_SRC}"
mpv "${AUDIO_DST}"

# bonsai:
mkdir ${HOMEDIR}/{Notes,Tools,Visuals}
git clone https://gitlab.com/jallbrit/cbonsai ${HOMEDIR}/Tools/
cd ${HOMEDIR}/Tools/cbonsai/
make install PREFIX=${HOMEDIR}/.local
make install

# GUI themes:
git clone https://github.com/addy-dclxvi/openbox-theme-collections ${HOMEDIR}/.themes

# Setting up audio:
amixer set Master on
amixer set Master 50%

# Greetings.mp3:
AUDIO_SRC='https://www.youtube.com/watch?v=kOKneP3tH90'
AUDIO_DST='${HOMEDIR}/Music/greetings_master.mp3'
youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output "${AUDIO_DST}" --no-playlist "${AUDIO_SRC}"
mpv "${AUDIO_DST}"

echo "You are done now, enjoy!"
