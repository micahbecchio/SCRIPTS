###########################
#                         #
# LAMP STACK: WORDPRESS   #
#                         #
###########################

# INSTALL AND CONFIGURE:
# 1.) Update system
# 2.) Install apache
# 3.) Install MySQL (and configure)
# 4.) Install php
# 5.) Restart Apache to load php
# 6.) Download and configure WordPress
# 7.) Create MySQL Database for user and WordPress
# 8.) Configure wordpress.conf for WordPress ( /etc/apache2/sites-available/ )
# 9.) Configure wordpress_config.php for WordPress ( /var/www/html/wordpress )
# 10.) Complete Worpress via Web Browser

# HARDEN:
# 11.) Change WordPress Database Table prefix
# 12.) Set Correct File Permissions
# 13.) Limit login Attempts Reloaded; Wordfence Security [Plug-in]
#  *.) *Disable File Editing.

# ADD PLUG.
# 14.) ADD Custom Plugins
 
#--------------------------------------
set -x  # Print commands and their arguments as they are executed

#-------------------------------#
# ..:: INSTALL & CONFIGURE ::.. #
#-------------------------------#
sudo apt update #1
sudo apt install apache2 -y #2
sudo apt install mysql-server -y #3
sudo mysql_secure_installation
sudo apt install php libapache2-mod-php php-mysql -y #4
sudo systemctl restart apache2 #5

#6
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo mv wordpress /var/www/html/
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chown -R 755 /var/www/html/wordpress

#7
sudo mysql -u root -p -e "
CREATE DATABASE wp; 
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Wp!240849';
GRANT ALL PRIVILEGES ON wp.* TO 'wpuser'@localhost';
FLUSH PRIVILEGES;
" 

#8
sudo bash -c 'cat <<EOF > /etc/apache2/sites-available/wordpress.conf
###########################################
#                                         #
# LAMP STACKIN: Apache Wordpress config   #
#                                         #
########################################### 

<VirtualHost *:80>
    ServerAdmin admin@example.com
    DocumentRoot /var/www/html/wordpress
    ServerName localhost
    #ServerAlias www.genus1.ddns.net

    <Directory /var/www/html/wordpress>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

EOF'

# ENABLE
sudo a2ensite wordpress.conf
sudo a2enmod rewrite
sudo systemctl restart apache2

#9
echo "Configuring WordPress wp-config.php..."
sudo cd /var/www/html/wordpress
sudo cp wp-config-sample.php wp-config.php
sudo sed -i "s/database_name_here/wp/" wp-config.php
sudo sed -i "s/username_here/wpuser/" wp-config.php
sudo sed -i "s/password_here/Wp!240849/" wp-config.php

#------------------#
# ..:: HARDEN ::.. #
#------------------#

# 10.) Change WordPress Database Table prefix
echo "Changing WordPress database table prefix..."
sudo sed -i "s/\$table_prefix = 'wp_';/\$table_prefix = 'genus_';/" wp-config.php

# 11
echo "Setting correct File Permissions for /var/www/html/wordpress/..."
sudo find /var/www/html/wordpress/ -type d -exec chmod 755 {} \;
sudo find /var/www/html/wordpress/ -type f -exec chmod 644 {} \;

# 14.) Install Wordfence Security [Plug-in] manually via WordPress dashboard
echo "\nPlease install the [Wordfence Security; Limit Login Attempts Reloaded] plugins via the WordPress dashboard."

# THIS DISABLES ALL EDITING FROM THE WP ADMIN DASHBOARD
#echo "Disabling file editing in WordPress..."
#echo "define('DISALLOW_FILE_EDIT, true);" >> /var/ww/html/wordpress/wp-config.php

echo "\nLAMP STACK: WORDPRESS, INSTALL COMPLETED." 
