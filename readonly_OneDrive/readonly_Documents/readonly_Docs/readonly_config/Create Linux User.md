# User

## Switch use

```sh
su
```

```sh
su - whiz
```

## Setup permission for laravel

```sh
sudo adduser whiz
```

```sh
sudo groupadd vpsusers
```

```sh
sudo gpasswd -a www-data vpsusers
```

```sh
sudo gpasswd -a whiz vpsusers
```

```sh
sudo chown -R whiz:vpsusers /var/www/html/foodpoint_server/storage/
```

```sh
sudo chmod -R g+rwx /var/www/html/foodpoint_server/storage/
```

```sh
sudo chmod -R g+s /var/www/html/foodpoint_server/storage/
```

# If everything else failed try this command
```sh
sudo chmod -R u+rwx,og+rx-w /var/www/html/foodpoint_server/storage/
```

```sh
sudo chmod -R 660 /var/www/html/test.petdoc.lk/storage/oauth-public.key
```

```sh
sudo chmod -R 660 /var/www/html/test.petdoc.lk/storage/oauth-private.key
```

```sh
sudo nano /etc/passwd       # Change “/bin/bash” to “/usr/bin/zsh”
```

---

## Password less sudo

### Log in to your server as the root user

```sh
sudo adduser whiz
```

```sh
sudo usermod -aG sudo whiz
```

```sh
sudo update-alternatives --config editor
```

```sh
sudo visudo
```

```sh
whiz ALL=(ALL) NOPASSWD:ALL
```

```sh
sudo groupadd vpsusers
```

```sh
sudo gpasswd -a www-data vpsusers
```

```sh
sudo gpasswd -a whiz vpsusers
```

```sh
chown -R :vpsusers /var/www/html/
```

---

## create user group

sudo groupadd laravel

## add composer user to group

sudo gpasswd -a composer-user laravel

## add web server to group

sudo gpasswd -a apache laravel

## jump to laravel path

sudo cd /path/to/your/beautiful/laravel-application

## optional: temporary disable any daemons that may read/write files/folders

## For example Apache & Queues

## optional: if you've been playing around with permissions

## consider resetting all files and directories to the default

sudo find ./ -type d -exec chmod 755 {} \;
sudo find ./ -type f -exec chmod 644 {} \;

## give users part of the laravel group the standard RW and RWX

## permissions for the existing files and folders respectively

sudo chown -R :vpsusers ./storage
sudo chown -R :vpsusers ./bootstrap/cache
sudo find ./storage -type d -exec chmod 775 {} \;
sudo find ./bootstrap/cache -type d -exec chmod 775 {} \;
sudo find ./storage -type f -exec chmod 664 {} \;
sudo find ./bootstrap/cache -type f -exec chmod 664 {} \;

## give the newly created files/directories the group of the parent directory

## e.g. the laravel group

sudo find ./bootstrap/cache -type d -exec chmod g+s {} \;
sudo find ./storage -type d -exec chmod g+s {} \;

sudo apt-get install acl

## let newly created files/directories inherit the default owner

## permissions up to maximum permission of rwx e.g. new files get 664

## folders get 775

sudo setfacl -R -d -m g::rwx ./storage
sudo setfacl -R -d -m g::rwx ./bootstrap/cache

## Reboot so group file permissions refresh (required on Debian and Centos)

sudo shutdown now -r

## Group write permission to folder

```sh
sudo chmod -R g+w /etc/nginx/
```
