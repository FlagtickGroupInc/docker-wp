#!/usr/bin/env sh

set -e

DB_HOST="db-headless"
DB_PORT=3306

until nc -z "$DB_HOST" "$DB_PORT"; do
    printf '.'
    sleep 1
done

# Check if WordPress is already installed
if wp core is-installed --quiet; then
    exit 0
fi

# Download WordPress (force to ensure it's fresh)
wp core download --force

# Generate wp-config.php if it does not exist
if [ ! -f wp-config.php ]; then
    wp config create \
        --dbhost="$WORDPRESS_DB_HOST" \
        --dbname="$WORDPRESS_DB_NAME" \
        --dbuser="$WORDPRESS_DB_USER" \
        --dbpass="$WORDPRESS_DB_PASSWORD"
fi

# Set authentication secrets
wp config set JWT_AUTH_SECRET_KEY 'your-secret-here'
wp config set GRAPHQL_JWT_AUTH_SECRET_KEY 'your-secret-here'

# Install WordPress
wp core install \
    --url="$WORDPRESS_URL" \
    --title="$WORDPRESS_TITLE" \
    --admin_user="$WORDPRESS_ADMIN_USER" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --skip-email

# Update settings
wp option update blogdescription "$WORDPRESS_DESCRIPTION"
wp rewrite structure "$WORDPRESS_PERMALINK_STRUCTURE"

# Activate theme and remove defaults
wp theme activate postlight-headless-wp
wp theme delete twentytwentyfive twentytwentythree twentytwentyfour --force

# Remove default plugins and install necessary ones
wp plugin delete akismet hello --quiet
wp plugin install --activate --force \
    acf-to-wp-api \
    advanced-custom-fields \
    custom-post-type-ui \
    wordpress-importer \
    wp-rest-api-v2-menus \
    jwt-authentication-for-wp-rest-api \
    wp-graphql \
    https://github.com/wp-graphql/wp-graphql-jwt-authentication/archive/refs/tags/v0.4.1.zip \
    https://github.com/wp-graphql/wp-graphql-acf/archive/master.zip \
    /var/www/plugins/*.zip

# Import starter content
wp import /var/www/initial.wordpress.xml --authors=skip --skip=attachment
