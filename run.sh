#!/bin/bash

# Remove default stuff
rm /etc/apache2/sites-available/*
rm /etc/apache2/sites-enabled/*

# Make sure all available sites are enabled
while IFS= read -r -u3 -d $'\0' file; do
    fullpath=`readlink -f ${file}`;
    ln -sf $fullpath /etc/apache2/sites-available/
done 3< <(find . -maxdepth 4 -type f -iwholename './sites/*/conf/*.conf' -print0)

a2ensite *.conf
a2enmod rewrite

apache2ctl -D FOREGROUND