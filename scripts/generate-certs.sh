#!/bin/sh

CERT_DIR="/etc/nginx/certs"

# Liste des domaines pour lesquels générer des certificats
DOMAINS="site1.local site2.local"

for DOMAIN in $DOMAINS; do
    echo "Génération des certificats SSL pour $DOMAIN..."
    openssl req -x509 -nodes -days 365 \
      -newkey rsa:2048 \
      -keyout "$CERT_DIR/$DOMAIN.key" \
      -out "$CERT_DIR/$DOMAIN.crt" \
      -subj "/CN=$DOMAIN"
    echo "Certificats SSL générés pour $DOMAIN."
done
