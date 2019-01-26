#!/bin/bash
yum update -y --exclude=kernel
yum install -y vim wget git unzip screen

# Install Apache
yum install -y httpd httpd-devel httpd-tools
systemctl enable httpd
systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

chcon -R -t httpd_sys_content_t /var/www/html
systemctl start httpd

#PHP
yum install -y php php-cli php-common php-mysql

#Mysql
yum install -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum install mysql-community-server
systemctl enable mysqld
systemctl start mysqld

#Download starter content from github
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/yogi29/vagrant-test/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/yogi29/vagrant-test/master/files/info.php



#Restart Apache
systemctl restart httpd