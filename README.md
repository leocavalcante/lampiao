# Lampião
The Cabra Macho's LAMP image

<img align="center" src="https://upload.wikimedia.org/wikipedia/commons/5/5c/Lampi%C3%A3o_MB.jpg" alt="Lampião" height="250">

(Actually there is no MySQL included)

```Dockerfile
FROM leocavalcante/lampiao:1.0
```

Overriding default configs

```Dockerfile
COPY config/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY config/php.ini /usr/local/etc/php/
```

### Single run

```bash
docker run -d -p 8000:80 --name my-lamp-app -v "$PWD":/var/www/html leocavalcante/lampiao:1.0
```

### Docker Compose

```yaml
version: '2'
services:
  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: ${DB_PASSWORD}
      MYSQL_DATABASE: ${DB_DATABASE}
      MYSQL_USER: ${DB_USERNAME}
      MYSQL_PASSWORD: ${DB_PASSWORD}
    volumes:
      - ./data/:/var/lib/mysql/

  web:
    image: leocavalcante/lampiao:1.0
    volumes:
      - ./:/var/www/html/
    ports:
      - "${APP_PORT}:80"
    links:
      - db

```
