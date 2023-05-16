WORKDIR /var/www/html
RUN git clone https://github.com/Maquequette/back-symfony.git .

# Installer les dépendances du projet Laravel
RUN composer install 