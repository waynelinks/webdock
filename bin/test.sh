#!/usr/bin/env bash

function print_header {
    echo -e "\033[44mTest:\033[0m" $1
}

function print_divider {
    echo -e "\033[44m~\033[0m"
}

function print_http_status_code {
    curl -o /dev/null --insecure --silent --head --write-out '%{http_code}\n' $1
}

source .env
DOMAIN="$COMPOSE_PROJECT_NAME.localhost"

print_header "Is PHP working?"
docker-compose exec php php --version

print_header "Is PHP-FPM working?"
docker-compose exec php php-fpm --version

print_header "Is Cron working inside PHP container?"
docker-compose exec php service cron status
print_divider
docker-compose exec php crontab -u www-data -l

print_header "Is Nginx working?"
docker-compose exec nginx nginx -v

print_header "Is HTTP responsing? (301 is ok)"
print_http_status_code "http://$DOMAIN"

print_header "Is HTTPS responsing?"
print_http_status_code "https://$DOMAIN"

print_header "Is MariaDB working?"
docker-compose exec mariadb mysql --version

print_header "Is Redis working?"
docker-compose exec redis redis-cli --version
print_divider
docker-compose exec redis redis-server --version

print_header "Is Composer working?"
docker-compose run --rm --no-deps composer --version

print_header "Is NPM working?"
docker-compose run --rm --no-deps npm --version

print_header "Is phpMyAdmin responsing?"
print_http_status_code "http://$DOMAIN:$PHPMYADMIN_PORT"

print_header "Is MailHog responsing? (404 is ok)"
print_http_status_code "http://$DOMAIN:$MAILHOG_PORT"
