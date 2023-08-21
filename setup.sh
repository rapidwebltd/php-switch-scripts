#!/bin/bash

echo "* Refreshing software repositories..."
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

echo "* Installing prerequisite software packages..."
sudo apt-get install -y software-properties-common

echo "* Setting up third-party repository to allow installation of multiple PHP versions..."
sudo add-apt-repository -y ppa:ondrej/php

echo "* Refreshing software repositories..."
sudo apt-get update

echo "* Installing PHP 5.6..."
sudo apt-get install -y php5.6 php5.6-common php5.6-cli

echo "* Installing PHP 5.6 extensions..."
sudo apt-get install -y php5.6-curl php5.6-mcrypt php5.6-soap php5.6-bz2 php5.6-gd php5.6-mysql php5.6-sqlite3 php5.6-json php5.6-opcache php5.6-xml php5.6-mbstring php5.6-readline php5.6-xmlrpc php5.6-zip php5.6-intl php5.6-redis

echo "* Installing PHP 7.0..."
sudo apt-get install -y php7.0 php7.0-common php7.0-cli

echo "* Installing PHP 7.0 extensions..."
sudo apt-get install -y php7.0-gd php7.0-mysql php7.0-sqlite3 php7.0-soap php7.0-xsl php7.0-json php7.0-opcache php7.0-mbstring php7.0-readline php7.0-curl php7.0-mcrypt php7.0-xml php7.0-zip php7.0-intl php7.0-redis

echo "* Installing PHP 7.1..."
sudo apt-get install -y php7.1 php7.1-common php7.1-cli

echo "* Installing PHP 7.1 extensions..."
sudo apt-get install -y php7.1-gd php7.1-mysql php7.1-sqlite3 php7.1-soap php7.1-xsl php7.1-json php7.1-opcache php7.1-mbstring php7.1-readline php7.1-curl php7.1-mcrypt php7.1-xml php7.1-zip php7.1-intl php7.1-redis

echo "* Installing PHP 7.2..."
sudo apt-get install -y php7.2 php7.2-common php7.2-cli

echo "* Installing PHP 7.2 extensions..."
sudo apt-get install -y php7.2-bz2 php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xsl php7.2-zip php7.2-intl php7.2-redis

echo "* Installing PHP 7.3..."
sudo apt-get install -y php7.3 php7.3-common php7.3-cli

echo "* Installing PHP 7.3 extensions..."
sudo apt-get install -y php7.3-bz2 php7.3-curl php7.3-gd php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-readline php7.3-soap php7.3-sqlite3 php7.3-tidy php7.3-xml php7.3-xsl php7.3-zip php7.3-intl php7.3-redis

echo "* Installing PHP 7.4..."
sudo apt-get install -y php7.4 php7.4-common php7.4-cli

echo "* Installing PHP 7.4 extensions..."
sudo apt-get install -y php7.4-bz2 php7.4-curl php7.4-gd php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-soap php7.4-sqlite3 php7.4-tidy php7.4-xml php7.4-xsl php7.4-zip php7.4-intl php7.4-redis

echo "* Installing PHP 8.0..."
sudo apt-get install -y php8.0 php8.0-common php8.0-cli

echo "* Installing PHP 8.0 extensions..."
sudo apt-get install -y php8.0-bz2 php8.0-curl php8.0-gd php8.0-mbstring php8.0-mysql php8.0-opcache php8.0-readline php8.0-soap php8.0-sqlite3 php8.0-tidy php8.0-xml php8.0-xsl php8.0-zip php8.0-intl php8.0-redis

echo "* Installing PHP 8.1..."
sudo apt-get install -y php8.1 php8.1-common php8.1-cli

echo "* Installing PHP 8.1 extensions..."
sudo apt-get install -y php8.1-bz2 php8.1-curl php8.1-gd php8.1-mbstring php8.1-mysql php8.1-opcache php8.1-readline php8.1-soap php8.1-sqlite3 php8.1-tidy php8.1-xml php8.1-xsl php8.1-zip php8.1-intl php8.1-redis

echo "* Installing PHP 8.2..."
sudo apt-get install -y php8.2 php8.2-common php8.2-cli

echo "* Installing PHP 8.2 extensions..."
sudo apt-get install -y php8.2-bz2 php8.2-curl php8.2-gd php8.2-mbstring php8.2-mysql php8.2-opcache php8.2-readline php8.2-soap php8.2-sqlite3 php8.2-tidy php8.2-xml php8.2-xsl php8.2-zip php8.2-intl php8.2-redis

echo "* Installing memcached extensions..."
sudo apt-get install -y memcached php-memcache php-memcached php7.0-memcached php7.1-memcached php7.2-memcached php7.3-memcached php7.4-memcached php8.0-memcached php8.1-memcached php8.2-memcached

echo "* Installing imap extensions..."
sudo apt-get install -y php-imap php7.2-imap php7.3-imap php7.4-imap php8.0-imap php8.1-imap php8.2-imap

echo "* Installing php-common and gcc..."
sudo apt-get install php php-common gcc

echo "* Installing imagemagick/imagick extensions..."
sudo apt-get install imagemagick
sudo apt-get install php-imagick php5.6-imagick php7.0-imagick php7.1-imagick php7.2-imagick php7.3-imagick php7.4-imagick php8.0-imagick php8.1-imagick php8.2-imagick

echo "* Installing PHP-FPM..."
sudo apt-get install php5.6-fpm php7.0-fpm php7.1-fpm php7.2-fpm php7.3-fpm php7.4-fpm  php8.0-fpm php8.1-fpm php8.2-fpm

echo "* Enabeling mod_rewrite, mod_headers and vhost_alias..."
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod vhost_alias

sudo apt-get install libapache2-mod-fcgid
sudo apt install software-properties-common
sudo a2enmod actions alias proxy_fcgi fcgid

echo "* Add an php.ini to your home folder for easy adding of settings to all PHP-versions..."

echo -e "memory_limit = 2G\n" > ~/php.ini

sudo ln -s ~/php.ini /etc/php/5.6/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/7.0/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/7.1/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/7.2/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/7.3/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/7.4/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/8.0/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/8.1/mods-available/php.ini
sudo ln -s ~/php.ini /etc/php/8.2/mods-available/php.ini

sudo phpenmod php

echo "* Restart apache..."
sudo systemctl restart apache2

echo "* Setup complete. You may now use the 'switch-php.sh' script."
