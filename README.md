# Self-Hosted Homelab

A personal homelab built using an old Lenovo laptop, Ubuntu Server, Docker, and Tailscale. This project documents my journey of building and managing my own self-hosted infrastructure, with private access to personal photos and files from anywhere.

## Project Overview

The goal of this project was to repurpose an old laptop into a personal home server and learn practical system administration, containerisation, networking, remote access, storage management, and self-hosting.

The server runs multiple services using Docker and Docker Compose, with Portainer for container management and Tailscale for secure remote connectivity.


## Architecture Diagram

The following diagram illustrates the overall homelab infrastructure, including Docker services, databases, storage, and remote connectivity.

[View the complete architecture diagram](architecture/homelab-architecture.md).


## Architecture

**Infrastructure overview:**

- **Host machine:** Lenovo laptop
- **Operating system:** Ubuntu Server 24.04 LTS
- **Containerisation:** Docker Engine and Docker Compose
- **Container management:** Portainer CE
- **Remote access:** Tailscale VPN
- **Photo management:** Immich
- **Cloud storage:** Nextcloud
- **Database:** MariaDB and PostgreSQL

## Services

| Service | Purpose | Access |
|---|---|---|
| Immich | Self-hosted photo and video management | Port 2283 |
| Nextcloud | Personal cloud storage and file management | Port 8080 |
| Portainer | Docker container and stack management | Port 9443 |
| Tailscale | Private remote access to the server | VPN |

Services are hosted on the Ubuntu server and accessed through the private network or Tailscale.

## Hardware and Storage

The project uses an old Lenovo laptop as its server.

- Approximately 1 TB physical storage
- Ubuntu LVM storage configuration
- Root logical volume expanded to utilise available storage
- Dedicated directories for Immich data and server backups

### Storage layout

```text
/srv/
├── immich/
│   ├── library/
│   ├── postgres/
│   └── profile/
├── backups/
├── documents/
├── nextcloud/
└── vaultwarden/
```

## Remote Access

Tailscale provides secure remote connectivity to the homelab without requiring traditional router port forwarding.

This allows authorised devices connected to the same Tailscale network to access services hosted on the server.

## Backup and Recovery

A custom Bash script automates Nextcloud backups.

The backup process:

1. Enables Nextcloud maintenance mode.
2. Archives the Nextcloud Docker volume.
3. Exports the MariaDB database using `mariadb-dump`.
4. Disables maintenance mode after the script exits.

Backups are stored in timestamped directories under `/srv/backups/`.

A root cron job schedules the backup daily.

See [`scripts/`](scripts/) and [`documentation/backup-configuration.md`](documentation/backup-configuration.md).

## Repository Structure

```text
self-hosted-homelab/
│
├── architecture/
│
├── docker/
│   ├── immich/
│   │   ├── docker-compose.yml
│   │   ├── .env.example
│   │   └── README.md
│   │
│   └── nextcloud/
│       ├── docker-compose.yml
│       ├── .env.example
│       └── README.md
│
├── documentation/
│   ├── backup-configuration.md
│   ├── docker-setup.md
│   ├── networking-and-ssh.md
│   ├── server-setup.md
│   ├── storage-and-lvm.md
│   ├── tailscale-setup.md
│   └── ubuntu-installation.md
│
├── scripts/
│   ├── README.md
│   └── nextcloud-backup.sh
│
├── .gitignore
└── README.md
```

## Documentation

Detailed setup and configuration guides are available in the [`documentation/`](documentation/) directory.

| Document | Description |
|---|---|
| [Ubuntu Installation](documentation/ubuntu-installation.md) | Ubuntu Server installation |
| [Server Setup](documentation/server-setup.md) | Initial server configuration |
| [Docker Setup](documentation/docker-setup.md) | Docker and Portainer setup |
| [Networking and SSH](documentation/networking-and-ssh.md) | Network configuration and remote shell access |
| [Tailscale Setup](documentation/tailscale-setup.md) | Private remote connectivity |
| [Storage and LVM](documentation/storage-and-lvm.md) | Storage expansion and logical volume management |
| [Backup Configuration](documentation/backup-configuration.md) | Nextcloud backup and automation |

## Security Considerations

- Remote access is provided through Tailscale.
- Environment variables and credentials are kept outside the public repository.
- Example environment files contain placeholders, not actual passwords.
- Database backups and personal files are not committed to GitHub.
- Avoid exposing administrative interfaces directly to the public internet.

## Technologies Learned

Through this project, I gained practical experience with:

- Linux system administration
- Ubuntu Server installation and configuration
- Docker and Docker Compose
- Portainer stack management
- Linux storage management and LVM
- SSH remote administration
- VPN-based networking with Tailscale
- Self-hosted applications and database management
- Bash scripting and cron automation
- Backup and recovery fundamentals
- Git and GitHub documentation

## Future Improvements

- Implement automated backup retention and off-server backup copies.
- Test full Nextcloud restoration.
- Improve server monitoring and resource utilisation.
- Strengthen credential management and access controls.
- Expand infrastructure documentation and architecture diagrams.

## Disclaimer

This repository documents my personal homelab setup for learning and experimentation. Configuration files are provided as references and may require modification for different hardware, network environments, and deployments.

Always review environment variables, credentials, storage paths, and network exposure before deploying.

---

**Built as a hands-on learning project in Linux, Docker, networking, and self-hosted infrastructure.**
