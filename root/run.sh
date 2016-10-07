#!/bin/bash
env

echo "----"
id

ls -al /var/lib/nginx/
ls -al /var/log/nginx/

nginx -c /etc/nginx/nginx.conf
