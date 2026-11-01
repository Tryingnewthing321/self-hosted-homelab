# Docker Setup and Container Management

## 1. Introduction

Docker is the core containerization platform used in this homelab. It allows multiple applications and their dependencies to run in isolated containers on the Ubuntu Server host.

The following services are managed using Docker:

- Immich
- Nextcloud
- Portainer CE
- PostgreSQL
- MariaDB
- Valkey (Redis-compatible service used by Immich)

## 2. Docker Installation

Docker Engine was installed on Ubuntu Server to provide container runtime functionality.

Verify the installation:

```bash
docker --version
```

Check Docker Compose:

```bash
docker compose version
```

Check whether the Docker service is running:

```bash
sudo systemctl status docker
```

Start Docker if necessary:

```bash
sudo systemctl start docker
```

Enable Docker to start automatically during boot:

```bash
sudo systemctl enable docker
```

## 3. Docker Compose

Docker Compose is used to define and manage multi-container applications.

Instead of manually creating individual containers, Compose configuration files define:

- Container images
- Services and dependencies
- Port mappings
- Environment variables
- Persistent storage
- Docker networks

Common commands:

```bash
docker compose up -d
```

Start services in detached mode.

```bash
docker compose down
```

Stop and remove containers and networks created by the Compose project.

```bash
docker compose ps
```

Display the status of services.

```bash
docker compose logs -f
```

View application logs.

## 4. Portainer CE

Portainer CE provides a graphical interface for managing Docker containers.

It is used to:

- View running containers.
- Inspect container logs.
- Start and stop services.
- Manage Docker images.
- Monitor container status.
- Deploy applications using Docker Compose stacks.

Portainer web interface:

```text
https://SERVER-IP:9443
```

The address above assumes the default Portainer HTTPS port mapping used in this homelab. Access is intended through the local network or secure remote connectivity.

## 5. Deployed Containers

The following containers are part of the homelab infrastructure.

| Container / Service | Purpose |
|---|---|
| Immich Server | Photo and video management |
| Immich Machine Learning | Machine-learning features |
| Immich PostgreSQL | Immich database |
| Immich Valkey | Cache and background job support |
| Nextcloud | Private cloud storage |
| MariaDB | Nextcloud database |
| Portainer CE | Docker management interface |

## 6. Persistent Storage

Persistent storage ensures that application data remains available even when containers are recreated.

Important host directories include:

```text
/srv/
├── backups/
├── documents/
├── immich/
│   ├── library/
│   ├── postgres/
│   └── profile/
├── nextcloud/
└── vaultwarden/
```

The Immich library and database storage are mapped to persistent host directories.

Nextcloud also uses persistent storage for its application data and database.

## 7. Container Management Commands

List running containers:

```bash
docker ps
```

List all containers:

```bash
docker ps -a
```

View Docker resource usage:

```bash
docker stats
```

List downloaded images:

```bash
docker images
```

Restart a container:

```bash
docker restart CONTAINER_NAME
```

Inspect a container:

```bash
docker inspect CONTAINER_NAME
```

## 8. Important Security Practices

- Never publish `.env` files containing credentials.
- Avoid exposing database ports directly to the public internet.
- Use strong passwords for application and database accounts.
- Keep Docker images and containers updated carefully.
- Maintain backups of persistent application data.
- Restrict administrative interfaces to trusted networks.

## 9. Deployment Configuration

Sanitized Docker Compose configuration files for the applications will be maintained in the repository's `docker/` directory.

These files should use environment variables for credentials rather than hardcoded passwords.

## 10. Summary

Docker provides the foundation for running self-hosted applications in this homelab.

Docker Compose simplifies deployment, while Portainer CE provides a graphical management interface. Persistent storage protects application data across container restarts and recreation.
