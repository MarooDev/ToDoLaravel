FROM php:8.2-apache

# Set environment variable
ENV DEBIAN_FRONTEND=noninteractive

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libonig-dev \
    libicu-dev \
    zlib1g-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd intl pdo pdo_mysql zip opcache

# Enable mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Create necessary directories to avoid chmod errors
RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache

# Set permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port 80
EXPOSE 80

CMD ["apache2-foreground"]
