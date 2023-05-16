# Utiliser l'image de PHP 8.0 avec Apache
FROM php:8.2-apache

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    unzip


# Prend l'exécutable de l'installateur 
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Activer les modules Apache nécessaires pour exécuter Laravel
RUN a2enmod rewrite && a2enmod headers



# Exposer le port Apache et lancer le serveur
EXPOSE 82
CMD ["php","-S","0.0.0.0:82","-t","public/"]
