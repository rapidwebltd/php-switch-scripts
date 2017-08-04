#!/bin/bash

echo "* Disabling Apache PHP 7.0 module..."
sudo a2dismod php7.0

echo "* Enabling Apache PHP 5.6 module..."
sudo a2enmod php5.6

echo "* Restarting Apache..."
sudo service apache2 restart

echo "* Switching CLI PHP to 7.0..."
sudo update-alternatives --set php /usr/bin/php5.6

echo "* Switch to PHP 5.6 complete."