GO_VERSION=1.20.2
DISCORD_VERSION=0.0.26

apt update;
apt install htop;

# Dock opacity Pop.OS only
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.4

# Basic deps for Chrome, Discord and others
apt install libgconf-2-4 libgconf-2-4 gconf-service gconf-service-backend gconf2-common libc++1 libc++1-14 libc++abi1-14 libgconf-2-4 libunwind-14libgconf-2-4

cd $HOME/Downloads/

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# VSCode
apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

apt install apt-transport-https
apt update
apt install code # or code-insiders

# Git
apt-get install git

# Docker
apt-get remove docker docker-engine docker.io containerd runc
apt-get install \
    ca-certificates \
    curl \
    gnupg
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# NVM with latest Node LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install --lts

# GO
wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
echo 'export PATH="$PATH:/usr/local/go/bin"' >> $HOME/.bashrc
source $HOME/.bashrc

# Python 3
apt-get install python3 python3-dev


# CopyQ https://github.com/hluk/CopyQ
add-apt-repository ppa:hluk/copyq
apt-get update && apt install copyq

# Discord
curl https://dl.discordapp.net/apps/linux/$DISCORD_VERSION/discord-$DISCORD_VERSION.deb -o discord-$DISCORD_VERSION.deb
dpkg -i discord-$DISCORD_VERSION.deb

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list 
apt-get update && apt-get install spotify-client


#TODO: postman https://learning.postman.com/docs/getting-started/installation-and-updates/#installing-postman-on-linux
curl https://dl.pstmn.io/download/latest/linux_64 -o postman-linux-x64.tar.gz
tar -xvf postman-linux-x64.tar.gz -C /opt/postman/
echo "[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/opt/postman/Postman/app/Postman %U
Icon=/opt/postman/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;"> ~/.local/share/applications/Postman.desktop




#TODO: dbeaver https://dbeaver.io/download/


#OpenVPN
wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-jammy.list
apt update
apt install openvpn3







apt update


# To add multiple git users
# https://code.tutsplus.com/tutorials/quick-tip-how-to-work-with-github-and-multiple-accounts--net-22574
# And multiple emails
# https://stackoverflow.com/questions/4220416/can-i-specify-multiple-users-for-myself-in-gitconfig/43654115#43654115