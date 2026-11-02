# Immich Deployment

## Overview

Immich is a self-hosted photo and video management application deployed on my Ubuntu Server homelab using Docker Compose.

It provides private photo storage, media browsing and machine-learning-based features.

## Architecture

The deployment consists of four services:

| Service | Description |
|---|---|
| Immich Server | Main application |
| Immich Machine Learning | Machine-learning processing |
| PostgreSQL | Database |
| Valkey | Cache and background job support |

## Storage Configuration

| Component | Host directory |
|---|---|
| Media library | `/srv/immich/library` |
| PostgreSQL data | `/srv/immich/postgres` |

## Network Configuration

| Port | Purpose |
|---|---|
| 2283 | Immich web application |

The application is accessed through the local network or remotely through Tailscale.

## Deployment

1. Install Docker Engine and Docker Compose.
2. Download or clone the Immich deployment configuration.
3. Create a `.env` file using `.env.example` as a reference.
4. Configure the storage paths and database password.
5. Start the services:

```bash
docker compose up -d
```

6. Verify the running containers:

```bash
docker compose ps
```

7. View logs:

```bash
docker compose logs -f
```

## Configuration Files

- `docker-compose.yml` – Defines the Immich services and deployment configuration.
- `.env.example` – Provides example environment variables.

## Security

- Actual environment files are excluded from version control.
- Database credentials are stored in environment variables.
- Remote access is provided through Tailscale.
- Persistent media and database directories are maintained on the server.

## Official Documentation

https://docs.immich.app/install/docker-compose
