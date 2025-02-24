# Server setup

```sh
ssh-keygen -t ed25519 -C "whizchain19@gmail.com"

eval $(ssh-agent -s)

ssh-add ~/.ssh/whizchain_laravel_github

sudo chown -R www-data:www-data /home/whizchain/

sudo apt install certbot python3-certbot-nginx
```

## Wildcard subdomain

```sh
sudo certbot certonly --agree-tos --email <admin@foodpoint.app> --manual --preferred-challenges=dns --server <https://acme-v02.api.letsencrypt.org/directory> -d \*.foodpoint.app

sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/

sudo nginx -t

sudo apt install php7.4-fpm

sudo systemctl reload nginx

sudo certbot --nginx -d example.com -d <www.example.com>

sudo tail -f /var/log/nginx/error.log
```

---

```sh
composer install --optimize-autoloader --no-dev

cp .env.example .env

php artisan migrate

php artisan db:seed --force

php artisan storage:link

php artisan config:cache

mkdir -p storage/framework/cache/data

mkdir -p storage/framework/sessions

mkdir -p storage/framework/views

php artisan route:cache

php artisan view:cache

```

---

```sh
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear
composer dump-autoload
```

---

## Setting up nginx basic auth

```sh
sudo apt-get install apache2-utils

sudo htpasswd -c /etc/apache2/.htpasswd <user name>
```

### put following lines after server_name

```sh
auth_basic "Log in to continue";
auth_basic_user_file /etc/apache2/.htpasswd;
```

---

```sh
sudo usermod -a -G www-data ubuntu

sudo chgrp -R www-data /var/www

sudo chmod -R g+w /var/www
```

---

```sh
export NODE_OPTIONS="--max-old-space-size=1024"
```

---

## Increase Upload Size

```sh
sudo nano /etc/php/8.1/fpm/php.ini
```

```sh
upload_max_filesize = 100M
post_max_size = 100M
```

```sh
sudo nano /etc/nginx/nginx.conf
```

```sh
http{
  client_max_body_size 200M;

  client_body_timeout 180;
}
```

```sh
sudo systemctl restart php8.1-fpm.service
sudo systemctl reload nginx
```

---

## Fail2ban

```sh
sudo apt install fail2ban
```

```sh
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

```sh
sudo nano /etc/fail2ban/jail.local
```

```sh
[sshd]

enabled = true
```

```sh
sudo systemctl enable fail2ban
sudo systemctl restart fail2ban
sudo systemctl status fail2ban
```

```sh
sudo fail2ban-client status sshd
sudo fail2ban-client unban --all
sudo fail2ban-client unban <ip-address>
```
