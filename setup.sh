#!/bin/bash

echo "* Setting up third-party repository to allow installation of multiple PHP versions..."
sudo add-apt-repository -y ppa:ondrej/php > /dev/null

echo "* Refreshing software repositories..."
sudo apt-get update > /dev/null

echo "* Installing PHP 5.6..."
sudo apt-get install -y php5.6 > /dev/null

echo "* Installing PHP 5.6 extensions..."
sudo apt-get install -y php5.6-curl php5.6-mcrypt php5.6-soap php5.6-bz2 php5.6-gd php5.6-mysql php5.6-sqlite3 php5.6-cli php5.6-json php5.6-opcache php5.6-xml php5.6-common php5.6-mbstring php5.6-readline php5.6-xmlrpc php5.6-zip > /dev/null

echo "* Installing PHP 7.0..."
sudo apt-get install -y php7.0 > /dev/null

echo "* Installing PHP 7.0 extensions..."
sudo apt-get install -y php7.0-gd php7.0-mysql php7.0-sqlite php7.0-soap php7.0-xsl php7.0-cli php7.0-json php7.0-opcache php7.0-common php7.0-mbstring php7.0-readline php7.0-curl php7.0-mcrypt php7.0-xml php7.0-zip > /dev/null

echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."