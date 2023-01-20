#!/usr/bin/bash

if ! command -v php &> /dev/null
then
    echo "PHP not installed!"
    exit
fi

if ! command -v composer &> /dev/null
then
    echo "composer not installed!"
    exit
fi

if ! command -v node &> /dev/null
then
    echo "node js not installed!"
    exit
fi

if ! command -v npm &> /dev/null
then
    echo "node js not installed!"
    exit
fi

if ! command -v mysql &> /dev/null
then
    echo "mysql not installed!"
    exit
fi

if [ ! -d "./vendor" ]; then
   composer install
fi

if [ ! -d "./node_modules" ]; then
   npm install
fi

if [ ! -d "./public/storage" ]; then
   php artisan storage:link
fi

if [ ! -f "./.env" ]; then
   cp .env.example .env
   php artisan key:generate
   
   if read -p "Enter your DB user: " user
   then
      sed -ir "s/DB_USERNAME=.*/DB_USERNAME=$user/" .env
   else
      echo "Done! Next - config DB connection in .env and enter:"
      echo "php artisan serve and npm run dev"
      exit
   fi
   
   if read -p "Enter your DB password: " password
   then
      sed -ir "s/DB_PASSWORD=.*/DB_PASSWORD=$password/" .env
   else
      echo "Done! Next - config DB connection in .env and enter:"
      echo "php artisan serve and npm run dev"
      exit
   fi
   
   if read -p "Enter your Database name: " dbname
   then
      sed -ir "s/DB_DATABASE=.*/DB_DATABASE=$dbname/" .env
      mysql -u $user -p$password -e "CREATE DATABASE IF NOT EXISTS $dbname"
      php artisan migrate
   else
      echo "Done! Next - config DB connection in .env and enter:"
      echo "php artisan serve and npm run dev"
      exit
   fi
fi

echo "Done!"
