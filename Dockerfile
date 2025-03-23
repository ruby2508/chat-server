# Use the official PHP image with Apache
FROM php:8.2-cli

# Install required PHP extensions
RUN docker-php-ext-install sockets

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory
WORKDIR /var/www

# Copy the server code to the container
COPY . .

# Install Ratchet dependencies
RUN composer install

# Expose the WebSocket server port
EXPOSE 8080

# Start the WebSocket server
CMD ["php", "server.php"]
