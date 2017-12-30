#!/usr/bin/env bash
sudo yum groupinstall "Development Tools"
sudo yum install epel-release
sudo yum -y update
yum install -y wget bzip2 texlive net-tools alien gnutls-utils

if [ -f /etc/selinux/config ]
then
	>/etc/selinux/config
fi

cat /vagrant/resources/selinux.config > /etc/selinux/config

sudo setenforce 0

echo "Adding atomic corp repo.."
wget -q -O - https://www.atomicorp.com/installers/atomic | sh
echo "Installting openvas.."
yum install openvas -y

if [ -f /etc/redis.conf ]
then
	>/etc/redis.conf
fi

cat /vagrant/resources/redis.conf > /etc/selinux/redis.conf
systemctl enable redis && systemctl restart redis

firewall-cmd --permanent --add-port=9392/tcp
firewall-cmd --reload
firewall-cmd --list-port