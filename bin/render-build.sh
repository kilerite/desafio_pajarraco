#!/usr/bin/env bash
# Exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:truncate_all       # Borra el contenido de todas las tablas en la base de datos
bundle exec rake db:create     # Crea las tablas nuevamente
bundle exec rake db:migrate    # Ejecuta las migraciones pendientes
bundle exec rake db:seed       # Carga los datos iniciales (seed) en la base de datos