# Lampião

The Cabra Macho's LA*M*P image.

<a title="Benjamin Abrahão Botto [Public domain], via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File%3ALampi%C3%A3o_MB.jpg"><img width="256" alt="Lampião MB" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Lampi%C3%A3o_MB.jpg/256px-Lampi%C3%A3o_MB.jpg"/></a>

## Usage

```Dockerfile
FROM leocavalcante/lampiao:<version>
```

Overriding default configs

```Dockerfile
COPY config/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY config/php.ini /usr/local/etc/php/
```

### Single run

```bash
docker run -d -p 8000:80 --name my-lamp-app -v "$PWD":/var/www/html leocavalcante/lampiao:<version>
```

### Docker Compose

```yaml
version: '3'
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
    image: leocavalcante/lampiao:<version>
    volumes:
      - ./:/var/www/html/
    ports:
      - "${DOCKER_WEB_PORT}:80"
    links:
      - db

```
