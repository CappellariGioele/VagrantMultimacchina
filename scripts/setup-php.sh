#!/bin/bash

apt-get install php libapache2-mod-php -y
apt-get install php-mysql -y
systemctl restart apache2.service 
