
# Homelab Architecture

## Infrastructure Overview

This diagram illustrates the self-hosted homelab infrastructure running on an old Lenovo laptop with Ubuntu Server 24.04 LTS.

## Architecture Diagram

```mermaid
flowchart TB
    CLIENT["Client Devices<br/>Laptop / Mobile"]
    TS["Tailscale VPN"]

    subgraph SERVER["Lenovo Laptop — Ubuntu Server 24.04 LTS"]
        DOCKER["Docker Engine<br/>Docker Compose"]
        PORTAINER["Portainer CE"]

        subgraph IMMICH["Immich Stack"]
            IS["Immich Server<br/>Port 2283"]
            ML["Machine Learning"]
            REDIS["Valkey"]
            PG["PostgreSQL"]
        end

        subgraph NEXTCLOUD["Nextcloud Stack"]
            NC["Nextcloud<br/>Port 8080"]
            DB["MariaDB"]
        end

        BACKUP["Automated Backup<br/>Bash + Cron"]
        STORAGE["Server Storage<br/>/srv"]
    end

    CLIENT --> TS
    TS --> IS
    TS --> NC
    TS --> PORTAINER

    DOCKER --> IMMICH
    DOCKER --> NEXTCLOUD
    DOCKER --> PORTAINER

    IS --> PG
    IS --> REDIS
    IS --> ML
    NC --> DB

    BACKUP --> STORAGE
    IMMICH --> STORAGE
    NEXTCLOUD --> STORAGE
```

## Main Components

| Component | Technology | Purpose |
|---|---|---|
| Host | Ubuntu Server 24.04 LTS | Server operating system |
| Container runtime | Docker | Runs self-hosted services |
| Management | Portainer CE | Manages containers and stacks |
| Photo management | Immich | Stores and manages photos |
| Cloud storage | Nextcloud | Personal file management |
| Database | PostgreSQL | Immich database |
| Database | MariaDB | Nextcloud database |
| Remote access | Tailscale | Private remote connectivity |
| Automation | Bash and Cron | Nextcloud backups |

## Storage

Persistent application data is stored on the server.

- Immich library: `/srv/immich/library`
- Immich database: `/srv/immich/postgres`
- Immich profile: `/srv/immich/profile`
- Backups: `/srv/backups`

Nextcloud uses Docker named volumes for its application and database data.

## Network Access

| Service | Port |
|---|---:|
| Immich | 2283 |
| Nextcloud | 8080 |
| Portainer HTTPS | 9443 |

Remote access is provided through Tailscale.

## Notes

- Docker Compose manages application services.
- Portainer provides a graphical management interface.
- Tailscale provides private remote connectivity.
- Nextcloud backups are scheduled through root's cron configuration.

