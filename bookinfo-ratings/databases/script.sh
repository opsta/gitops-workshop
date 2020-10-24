#!/bin/sh

set -e
mongoimport --host localhost --username $MONGODB_USERNAME --password $MONGODB_PASSWORD \
  --db $MONGODB_DATABASE --collection ratings --drop --file /docker-entrypoint-initdb.d/ratings_data.json
