FROM debian:buster

# We allow the port:
EXPOSE 443

# Update and upgrade:
RUN apt update -y && apt upgrade -y

# Install nginx and OpenSSL:
RUN apt install nginx -y && apt install openssl -y

# Create TSL certificate and saves it:
RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes \
		-out /etc/nginx/ssl/TSL_certificate.crt -keyout /etc/nginx/ssl/TSL_private.key \
		-subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42/CN=alaaouam.42.fr/UID=alaaouam"

# Create directory to store nginx config files:
RUN mkdir -p /run/nginx

# Copy config file to the container:
COPY ./conf/nginx.conf /etc/nginx/conf.d/server.conf

# Ensure that we will have the proper rights we need:
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Avoid the container to stop:
CMD [ "nginx", "-g", "daemon off;" ]