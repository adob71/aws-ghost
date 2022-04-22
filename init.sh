#!/bin/bash -xe

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

apt-get update && sudo apt-get upgrade -y

apt-get install -y nginx 
sudo sed -i 's/# server_names_hash_bucket_size 64/server_names_hash_bucket_size 128/g' /etc/nginx/nginx.conf
sudo service nginx reload

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
apt-get install -y nodejs
npm install npm@latest -g

npm install ghost-cli@latest -g

chown -R ubuntu:ubuntu /var/www/
sudo -u ubuntu mkdir -p /var/www/blog && cd /var/www/blog
sudo -u ubuntu ghost install \
     --url "${url}" \
     --admin-url "${admin_url}" \
     --db "mysql" \
     --dbhost "${endpoint}" \
     --dbuser "${username}" \
     --dbpass "${password}" \
     --dbname "${database}" \
     --process systemd \
     --no-prompt 
