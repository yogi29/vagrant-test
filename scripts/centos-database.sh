#!/bin/bash

#Mysql
yum install -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum -y install mysql-community-server mysql-community-client MySQL-python
sudo systemctl enable mysqld
sudo systemctl start mysqld

#Download starter content from github
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/yogi29/vagrant-test/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/yogi29/vagrant-test/master/files/info.php
