#!/usr/bin/bash

composer install && npm install

if [ ! -f .env ]; then
   cp .env.example .env
fi

php artisan key:generate
php artisan storage:link

echo "Done! Next - config DB connection in .env and enter:"
echo "php artisan serve and npm run dev"
