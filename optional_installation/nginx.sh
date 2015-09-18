#!/bin/sh

# nginx Environment Install Script 
# *Optional

function install_unless_installed() {
  if rpm -qa $1 | grep -q $1; then
    true
  else
    sudo yum install -y $1
  fi
}

if [ ! -e /etc/yum.repos.d/nginx.repo ]; then
  REPO="/etc/yum.repos.d/nginx.repo"
  cat << 'EOS' | sudo tee $REPO
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1
EOS
fi

install_unless_installed nginx
sudo service nginx start

cd ~
ln -s /usr/share/nginx/html server
sudo chkcongig nginx on

