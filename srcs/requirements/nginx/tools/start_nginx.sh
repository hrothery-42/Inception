#!/bin/bash

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out /etc/nginx/ssl/hrothery.crt \
            -keyout /etc/nginx/ssl/hrothery.key \
            -subj "/C=DE/L=Wolfsburg/O=42/CN=hrothery.42.fr"


echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name hrothery.42.fr;

    ssl_certificate /etc/nginx/ssl/hrothery.crt;
    ssl_certificate_key /etc/nginx/ssl/hrothery.key;" > /etc/nginx/sites-available/default


echo '
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location ~ [^/]\.php(/|$) { 
            try_files $uri =404;
            fastcgi_pass wordpress:9000;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
} ' >>  /etc/nginx/sites-available/default

nginx -g "daemon off;"