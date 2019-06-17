#!/bin/bash

# Ubuntu <= 16.04
# postgres
sudo mkdir -p /usr/local/var/postgres/{pg_tblspc,pg_twophase,pg_stat,pg_stat_tmp,pg_replslot,pg_snapshots}/

# java
echo 'Setting up java evironment...'
mkdir ~/jdk
cp -R jdk1.8.0_211 ~/jdk/jdk1.8.0_211
sudo echo 'export JAVA_HOME=~/jdk/jdk1.8.0_211' >> ~/.bashrc
sudo echo 'export JAVA_HOME=~/jdk/jdk1.8.0_211' >> ~/.bash_profile
sudo echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> ~/.bashrc
sudo echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> ~/.bash_profile
source ~/.bashrc
source ~/.bash_profile
echo 'Done setting up java evironment'

# maven
echo 'Setting up maven evironment...'
mkdir ~/maven
cp -R apache-maven-3.6.1 ~/maven/apache-maven-3.6.1
sudo echo 'export M2_HOME=~/maven/apache-maven-3.6.1' >> ~/.bashrc
sudo echo 'export M2_HOME=~/maven/apache-maven-3.6.1' >> ~/.bash_profile
sudo echo 'export PATH=${PATH}:${M2_HOME}/bin' >> ~/.bashrc
sudo echo 'export PATH=${PATH}:${M2_HOME}/bin' >> ~/.bash_profile
source ~/.bashrc
source ~/.bash_profile
echo 'Done setting up maven evironment'

# locale
echo 'Setting up locale and language.'
sudo echo 'export LANGUAGE=en_US.UTF-8' >> ~/.bashrc
sudo echo 'export LANGUAGE=en_US.UTF-8' >> ~/.bash_profile
sudo echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc
sudo echo 'export LC_ALL=en_US.UTF-8' >> ~/.bash_profile
sudo echo 'export LANG=en_US.UTF-8' >> ~/.bashrc
sudo echo 'export LANG=en_US.UTF-8' >> ~/.bash_profile
sudo echo 'export LC_TYPE=en_US.UTF-8' >> ~/.bashrc
sudo echo 'export LC_TYPE=en_US.UTF-8' >> ~/.bash_profile
source ~/.bashrc
source ~/.bash_profile
echo 'Done setting up locale and language.'

# docker
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update -y
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}

# docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version