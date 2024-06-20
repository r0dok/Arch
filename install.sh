#!/bin/bash

USER=$(whoami)
HOMEDIR="/home/${USER}"

# Update system and install required packages
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm ffmpeg youtube-dl mpv discord neofetch steam bashtop asciiquarium git curl

# Function to download and play audio
download_and_play_audio() {
  local AUDIO_SRC=$1
  local AUDIO_DST=$2
  
  youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output "${AUDIO_DST}" --no-playlist "${AUDIO_SRC}"
  mpv "${AUDIO_DST}"
}

# Download and play "ara_ara.mp3"
AUDIO_SRC='https://www.youtube.com/watch?v=5Z5qYOuc1dE'
AUDIO_DST="${HOMEDIR}/Music/ara_ara.mp3"
download_and_play_audio "${AUDIO_SRC}" "${AUDIO_DST}"

# Download and play "greetings_master.mp3"
AUDIO_SRC='https://www.youtube.com/watch?v=kOKneP3tH90'
AUDIO_DST="${HOMEDIR}/Music/greetings_master.mp3"
download_and_play_audio "${AUDIO_SRC}" "${AUDIO_DST}"

# Create directories
mkdir -p ${HOMEDIR}/{Notes,Tools,Visuals}

# Clone and install cbonsai
git clone https://gitlab.com/jallbrit/cbonsai ${HOMEDIR}/Tools/cbonsai
cd ${HOMEDIR}/Tools/cbonsai
make install PREFIX=${HOMEDIR}/.local
make install

# Clone GUI themes
git clone https://github.com/addy-dclxvi/openbox-theme-collections ${HOMEDIR}/.themes

# Setup audio levels
amixer set Master on
amixer set Master 50%

# Install BlackArch tools
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
./strap.sh
yes | sudo pacman -S --needed catphish email2phonenumber holehe seeker simpleemailspoofer buster whatsmyname whatbreach twint trape social-vuln-scanner

echo "Setup is complete. Enjoy your system!"
