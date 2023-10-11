# Use an official WordPress image as a parent image
FROM wordpress:latest

# Set environment variables
ARG WP_DB_HOST
ARG WP_DB_NAME
ARG WP_DB_USER
ARG WP_DB_PASSWORD

ENV WORDPRESS_DB_HOST=${WP_DB_HOST}
ENV WORDPRESS_DB_NAME=${WP_DB_NAME}
ENV WORDPRESS_DB_USER=${WP_DB_USER}
ENV WORDPRESS_DB_PASSWORD=${WP_DB_PASSWORD}

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . .

# Run the entry point script
ENTRYPOINT ["docker-entrypoint.sh"]

# Define the default command to start the Apache web server
CMD ["apache2-foreground"]
