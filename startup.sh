#! /bin/sh

# Wait for DB services
# sh ./wait-for-services.sh
until nc -z -v -w30 db:3306; do
 echo 'Waiting for MySQL...'
 sleep 9
done
echo "MySQL is up and running!"

# Prepare DB (Migrate - If not? Create db & Migrate)
sh ./prepare-db.sh

# Pre-comple app assets
# sh ./asset-pre-compile.sh

# Start Application
bundle exec puma -C config/puma.rb
redis-server
