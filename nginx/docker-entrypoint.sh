# #!/bin/sh

# CONF_DIR="/etc/nginx/conf.d"
# CERT_PATH="/etc/letsencrypt/live/dev-task-app.com/fullchain.pem"
# OUTPUT_PATH="$CONF_DIR/default.conf"

# if [ ! -f "$CERT_PATH" ]; then
#     echo "No SSL cert found, generating HTTP-only config..."
#     cat <<EOF > $OUTPUT_PATH
# server {
#     listen 80;
#     server_name dev-task-app.com;

#     location /.well-known/acme-challenge/ {
#         root /var/www/certbot;
#     }

#     location / {
#         proxy_pass http://go-app:8080;
#     }
# }
# EOF
# else
#     echo "SSL cert found, generating HTTPS config..."
#     cat <<EOF > $OUTPUT_PATH
# # HTTP → HTTPS リダイレクト
# server {
#     listen 80;
#     server_name dev-task-app.com;

#     location /.well-known/acme-challenge/ {
#         root /var/www/certbot;
#     }

#     location / {
#         return 301 https://\$host\$request_uri;
#     }
# }

# # HTTPS
# server {
#     listen 443 ssl;
#     server_name dev-task-app.com;

#     ssl_certificate     /etc/letsencrypt/live/dev-task-app.com/fullchain.pem;
#     ssl_certificate_key /etc/letsencrypt/live/dev-task-app.com/privkey.pem;
#     ssl_protocols       TLSv1.2 TLSv1.3;
#     ssl_ciphers         HIGH:!aNULL:!MD5;

#     location / {
#         proxy_pass http://go-app:8080;
#         resolver 127.0.0.11;
#         proxy_http_version 1.1;
#         proxy_set_header Host \$host;
#         proxy_set_header X-Real-IP \$remote_addr;
#         proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
#         proxy_set_header X-Forwarded-Proto \$scheme;
#     }

#     # セキュリティヘッダー
#     add_header X-Frame-Options "SAMEORIGIN" always;
#     add_header X-Content-Type-Options "nosniff" always;
#     add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;
# }
# EOF
# fi

# nginx -g 'daemon off;'