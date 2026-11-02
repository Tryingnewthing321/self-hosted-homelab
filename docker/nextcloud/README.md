# Nextcloud Deployment

## Overview

Nextcloud is deployed on my Ubuntu Server homelab using Docker Compose and MariaDB.

It provides private cloud storage and file management.

## Architecture

The deployment consists of two services:

| Service | Container | Purpose |
|---|---|---|
| app | nextcloud | Nextcloud application |
| db | nextcloud-db | MariaDB database |

## Configuration

| Component | Configuration |
|---|---|
| Nextcloud image | nextcloud:latest |
| Database image | mariadb:11 |
| Application port | 8080 |
| Container web port | 80 |
| Database | nextcloud |
| Database user | nextcloud |

## Persistent Storage

| Volume | Container path |
|---|---|
| nextcloud_data | /var/www/html |
| nextcloud_db | /var/lib/mysql |

Both services use named Docker volumes for persistent storage.

## Deployment

1. Install Docker Engine and Docker Compose.
2. Configure environment variables using `.env.example`.
3. Create the actual `.env` file with secure passwords.
4. Start the application:

```bash
docker compose up -d
```

5. Check container status:

```bash
docker compose ps
```

6. View logs:

```bash
docker compose logs -f
```

## Access

Nextcloud is accessible through:

`http://SERVER-IP:8080`

Remote access is available through the configured Tailscale network.

## Security

- Database passwords are stored in environment variables.
- Actual `.env` files are excluded from Git.
- Persistent database and application data are stored in Docker volumes.
- Database services should not be exposed directly to the public internet.

## Official Documentation

https://docs.nextcloud.com/
