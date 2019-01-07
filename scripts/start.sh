#!/bin/bash

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app_directory/tmp/pids/server.pid

bundle check || bundle install

bundle exec rails s -b 0.0.0.0
