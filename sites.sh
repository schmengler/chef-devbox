#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Please run this script as root"
    exit 1
fi

echo
echo "Running Chef..."
echo "---------------"
echo
cd /etc/chef-devbox && chef-solo -c solo.rb -j solo.sites.json || { echo >&2 "Chef provsioning failed"; exit 1; }
service apache2 restart
