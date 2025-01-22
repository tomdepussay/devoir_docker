#!/bin/bash
set -e 
composer install --no-interaction
npm install
npm run build
php artisan key:generate
php artisan migrate
php artisan config:clear
php-fpm