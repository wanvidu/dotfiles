# VPS Config

sudo apt update && sudo apt dist-upgrade -y && sudo reboot

sudo apt install nginx

sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'

sudo ufw enable

sudo ufw status

sudo apt install php7.4 php7.4-cli php7.4-fpm php7.4-json php7.4-common php7.4-mysql php7.4-zip php7.4-gd php7.4-mbstring php7.4-curl php7.4-xml php7.4-bcmath php-cli unzip

sudo apt install php8.0 php8.0-cli php8.0-fpm php8.0-common php8.0-mysql php8.0-zip php8.0-gd php8.0-mbstring php8.0-curl php8.0-xml php8.0-bcmath php8.0-intl php8.0-gmp php-cli unzip

sudo apt install php8.1 php8.1-cli php8.1-fpm php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath php8.1-intl php-cli unzip

sudo apt install php8.2 php8.2-cli php8.2-fpm php8.2-common php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath php8.2-intl php-cli unzip

sudo apt install php8.3 php8.3-cli php8.3-fpm php8.3-common php8.3-mysql php8.3-zip php8.3-gd php8.3-mbstring php8.3-curl php8.3-xml php8.3-bcmath php8.3-intl php-cli unzip

sudo apt install php8.4 php8.4-cli php8.4-fpm php8.4-common php8.4-mysql php8.4-zip php8.4-gd php8.4-mbstring php8.4-curl php8.4-xml php8.4-bcmath php8.4-intl unzip


## Wordpress

sudo apt install php8.1-curl php8.1-gd php8.1-intl php8.1-mbstring php8.1-soap php8.1-xml php8.1-xmlrpc php8.1-zip php8.1-imagick

sudo apt install mysql-server

sudo mysql_secure_installation

sudo mysql

mysql -u root -p

SELECT user,authentication_string,plugin,host FROM mysql.user;

ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';

CREATE USER 'user'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';

GRANT ALL PRIVILEGES ON _._ TO 'user'@'localhost' WITH GRANT OPTION;

flush privileges;

sudo apt install php8.1-fpm

sudo apt install phpmyadmin

sudo phpenmod mbstring

sudo systemctl reload nginx

---

CREATE USER 'user'@'localhost' IDENTIFIED WITH caching_sha2_password BY <password>;

GRANT ALL PRIVILEGES ON <db name>.\* TO 'user'@'localhost';

FLUSH PRIVILEGES;

---

## SQL Server Remote Access

CREATE USER 'user'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'password';

CREATE USER 'user'@'%' IDENTIFIED WITH caching_sha2_password BY 'password';

GRANT ALL PRIVILEGES ON _._ TO 'user'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON _._ TO 'user'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

bind-address = 0.0.0.0

---

## SQL Allow Group By

set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

---

## Install Composer

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer

---

## Install Node

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

source ~/.bashrc

nvm

nvm install --lts

nvm install-latest-npm
