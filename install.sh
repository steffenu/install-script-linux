#!/bin/bash
echo "🔌 + update and upgrade"
sudo apt -y update && sudo apt -y upgrade

echo "🔌 + installing: chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm -rf ./google-chrome-stable_current_amd64.deb

echo "🔌 + installing: git"
sudo apt -y install git 

echo "🔌 + installing:-node"
sudo apt -y install npm
sudo npm install -g n
sudo n 14.19.0
node --version

echo "🔌 + installing:-composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && sudo php composer-setup.php --2.2 --install-dir=/usr/local/bin --filename=composer && php -r "unlink('composer-setup.php');" && sudo chmod +x /usr/local/bin/composer

echo "🔌 + installing:-vscode"
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

echo "🔌 + installing:-msteams"
wget -O teams.deb https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.5.00.10453_amd64.deb
sudo apt install -y ./teams.deb
rm -rf ~/teams.deb

echo "🔌 + installing:-php73"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update && sudo apt-get -y upgrade
sudo apt -y install php7.3-cli php7.3-mysql php7.3-sqlite3 php7.3-intl php7.3-mbstring php7.3-curl php7.3-xml php7.3-gd php7.3-zip php7.3-dom php7.3-pdo

echo "🔌 + installing:-php74"
sudo apt -y install php7.4-cli php7.4-mysql php7.4-sqlite3 php7.4-intl php7.4-mbstring php7.4-curl php7.4-xml php7.4-gd php7.4-zip php7.4-dom php7.4-pdo

echo "🔌 + installing:-php81"
sudo apt -y install php8.1-cli php8.1-mysql php8.1-sqlite3 php8.1-intl php8.1-mbstring php8.1-curl php8.1-xml php8.1-gd php8.1-zip php8.1-dom php8.1-pdo

echo "🔌 + installing:-php82"
sudo apt -y install php8.2-cli php8.2-mysql php8.2-sqlite3 php8.2-intl php8.2-mbstring php8.2-curl php8.2-xml php8.2-gd php8.2-zip php8.2-dom php8.2-pdo

echo "+ installing:-docker"
echo "+ create /www folder"
mkdir ~/www
sudo apt -y install docker.io docker-compose
sudo usermod -aG docker $USER

echo "🔌 + installing: extra applications"
sudo apt install -y htop gnome-tweaks remmina filezilla network-manager-openvpn-gnome
sudo snap install postman 

echo "🔌 +  added readonly ssh keys"
echo "🔌 +  please create your own ssh keys after"
cp utility.pub /home/$USER/.ssh
cp utility /home/$USER/.ssh
cd /home/$USER/.ssh
chmod 600 utility
chmod 600 utility.pub

ssh -T git@gitlab.lupcom.de

echo "🔌 +  installing:  docker steffen env -> www/dev-env"
cd /home/$USER/www
git clone git@gitlab.lupcom.de:dev-env/entwicklungsumgebung-steffen/docker.git dev-env

echo "🔌 +  installing:  contao toolset -> www/contao-toolset"
git clone git@gitlab.lupcom.de:dev-env/entwicklungsumgebung-steffen/contao-toolset.git

echo "🔌 + installing: mysql workbench"
wget https://github.com/steffenu/steffenu/raw/master/mysql/mysql-apt-config_0.8.23-1_all.deb
sudo apt install ./mysql-apt-config_0.8.23-1_all.deb
sudo apt update
sudo apt install -y mysql-workbench-community

echo "🔌 + installing: mkcert"
sudo apt install mkcert
sudo apt install -y libnss3-tools
sudo mkcert --install

####### STEFFEN EXTRA START
echo "🔌 + installing: gulp cli"
sudo npm install gulp-cli -g

echo "🔌 + installing: xbindkeys and solaar(logitech driver)"
echo "🔌 + dont forget to install hide top bar gnome extension ;)"
sudo apt-get install -y xbindkeys
sudo apt install -y solaar
sudo apt-get install -y chrome-gnome-shell
sudo apt install gnome-shell-extension-manager
####### STEFFEN EXTRA END

sudo reboot










