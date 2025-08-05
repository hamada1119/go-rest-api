#!/bin/sh

CONF_DIR="/etc/nginx/conf.d"
CERT_PATH="/etc/letsencrypt/live/dev-task-app.com/fullchain.pem"
TEMPLATE_PATH="/etc/nginx/templates/default.conf.template"
OUTPUT_PATH="$CONF_DIR/default.conf"

# 初回起動時に証明書がなければHTTPのみで起動
if [ ! -f "$CERT_PATH" ]; then
    echo "No SSL cert found, generating HTTP-only config..."
    cat <<EOF > $OUTPUT_PATH
server {
    listen 80;
    server_name dev-task-app.com;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        proxy_pass http://go-app:8080;
    }
}
EOF
else
    echo "SSL cert found, generating HTTPS config..."
    cp $TEMPLATE_PATH $OUTPUT_PATH
fi

# 起動
nginx -g 'daemon off;'
