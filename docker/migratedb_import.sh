#!/usr/bin/env sh

set -e

export WPMDB_EXCLUDE_RESIZED_MEDIA=1

if [ -z "$MIGRATEDB_LICENSE" ]
then
    exit
fi

if [ -z "$MIGRATEDB_FROM" ]
then
    exit
fi

wp plugin activate \
    wp-migrate-db-pro \
    wp-migrate-db-pro-cli \
    wp-migrate-db-pro-media-files

wp migratedb setting update license "$MIGRATEDB_LICENSE"

wp migratedb pull "$MIGRATEDB_FROM" --backup=prefix --media=compare

wp option update siteurl "$WORDPRESS_URL"
wp option update home "$WORDPRESS_URL"
