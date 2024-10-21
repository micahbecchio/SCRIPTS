#!/bin/bash

set -x  # Print commands and their arguments as they are executed

## #########################
#                          #
# ENABLE HTTPS: LAMP STACK #
#                          #
######### ##################

# Install Certbot
sudo apt update
sudo apt install certbot python3-certbot-apache -y

# Obtain and install SSL certificate
sudo certbot --apache <<EOF
admin@example.com
A
genus1.ddns.net
2
EOF

# Test Apache configuration
sudo apache2ctl configtest

# Reload Apache to apply changes
sudo systemctl reload apache2

# Test automatic renewal
sudo certbot renew --dry-run

echo "HTTPS setup complete. Please verify by visiting https://genus1.ddns.net"
