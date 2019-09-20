#
#
#

#
# Ask for install, check, update
#

apt -y update
apt -y install nginx

apt install php7.3

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
