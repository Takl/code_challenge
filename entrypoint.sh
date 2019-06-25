#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /application/tmp/pids/server.pid

# Compile the assets
#bundle exec rake assets:precompile

# Start the server
#bundle exec rails server

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

