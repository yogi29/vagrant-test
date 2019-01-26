#!/bin/bash

# Install Apache
yum install -y httpd httpd-devel httpd-tools
sudo systemctl enable httpd
sudo systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

chcon -R -t httpd_sys_content_t /var/www/html/
sudo systemctl start httpd

#PHP
yum install -y php php-cli php-common php-mysql

#Restart Apache
sudo systemctl restart httpd