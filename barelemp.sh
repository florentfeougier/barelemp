#
#
#

#
# Ask for install, check, update
#


#
# Composer
#
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

apt -y update
apt -y install nginx

apt install php7.3
apt install php-xml php-json php-bcmath php-mbcrypt php-pdo php-mysql php-ctype php-tokenizer
# check openssl php -i | grep -i openssl

# Check if Apache2 is installed
systemctl stop apache2
systemctl disable apache2

CREATE USER 'admin'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;


#
# Start our stack
#

ln -s /etc/nginx/sites-available/$vblock_fileconf /etc/nginx/sites-enabled/$vblock_fileconf

systemctl stop nginx
systemctl start nginx

systemctl stop php7.3-fpm
systemctl start php7.3-fpm
