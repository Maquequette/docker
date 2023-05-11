# Utiliser l'image de PHP 8.0 avec Apache
FROM php:8.2-apache

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    git 

# Prend l'exécutable de l'installateur 
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Cloner le référentiel Git
WORKDIR /var/www/html
RUN git clone https://github.com/Maquequette/back.git .

# Installer les dépendances du projet Laravel
RUN composer install --no-dev --optimize-autoloader

# Activer les modules Apache nécessaires pour exécuter Laravel
RUN a2enmod rewrite && a2enmod headers


# Exposer le port Apache et lancer le serveur
EXPOSE 80
CMD ["php", "artisan", "serve", "--port=80", "--host=0.0.0.0"]
