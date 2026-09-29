#!/bin/bash
set -e

# Pockej, nez se sit a VPC endpoints plne propaguji
sleep 60

# Aktualizace balicku
dnf update -y

# Instalace Nginx
dnf install -y nginx

# Zapnuti a spusteni Nginx
systemctl enable nginx
systemctl start nginx

# Jednoducha testovaci stranka
echo "<h1>Ahoj z Terraform projektu!</h1>" > /usr/share/nginx/html/index.html