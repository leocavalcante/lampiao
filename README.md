# Lampião
The Cabra Macho's LAMP image

<img align="center" src="https://upload.wikimedia.org/wikipedia/commons/5/5c/Lampi%C3%A3o_MB.jpg" alt="Lampião" height="250">

```Dockerfile
FROM lampiao:1.0
COPY config/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY config/php.ini /usr/local/etc/php/
```
