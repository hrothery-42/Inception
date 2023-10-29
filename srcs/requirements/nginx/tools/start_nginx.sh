#!/bin/bash

echo "
server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name hrothery.42.fr;

    ssl_certificate /etc/nginx/ssl/hrothery.42.fr.crt;
    ssl_certificate_key /etc/nginx/ssl/hrothery42.fr.key;" > /etc/nginx/sites-available/default

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