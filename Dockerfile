FROM php:8.2-apache

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip git \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev libonig-dev \
    libxml2-dev libicu-dev zlib1g-dev \
    && docker-php-ext-install zip intl pdo pdo_mysql gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Set working directory
WORKDIR /var/www/html


# Create required directories and set permissions
RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Install Composer dependencies
RUN if [ -f composer.json ]; then composer install --no-interaction --optimize-autoloader; fi

# Expose port
EXPOSE 80

CMD ["apache2-foreground"]
