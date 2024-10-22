#!/bin/bash

apt-get install mysql-server -y

sudo mysql -u root < /vagrant/scripts/webuser.sql

sudo sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql.service