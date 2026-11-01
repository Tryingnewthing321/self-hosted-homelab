# Self-Hosted Homelab

A personal self-hosted cloud infrastructure project built using an old Lenovo laptop running Ubuntu Server.

The goal of this project is to build, manage, and maintain a private cloud environment using open-source technologies, containerization, and secure remote access.

## Project Overview

This homelab runs multiple self-hosted services, allowing private photo management, file storage, remote administration, and infrastructure management without depending entirely on third-party cloud platforms.

## Hardware

| Component | Configuration |
|---|---|
| Host device | Lenovo laptop |
| Operating System | Ubuntu Server 24.04 LTS |
| Storage | Approximately 1 TB physical drive |
| Root filesystem | Approximately 914 GB |
| Network access | Ethernet/Wi-Fi |
 
## Technology Stack

| Technology | Purpose |
|---|---|
| Ubuntu Server | Host operating system |
| Docker | Containerization |
| Docker Compose | Multi-container deployment |
| Portainer CE | Container management |
| Tailscale | Secure remote access |
| Immich | Self-hosted photo and video management |
| Nextcloud | Private cloud storage |
| PostgreSQL | Immich database |
| MariaDB | Nextcloud database |
| OpenSSH | Remote server administration |

## Architecture

```text
                 Remote Devices
                 (Laptop / Phone)
                        |
                        |
                    Tailscale
                        |
                        |
              Ubuntu Server (Lenovo)
                        |
                  Docker Engine
                        |
       +----------------+----------------+
       |                |                |
    Immich           Nextcloud        Portainer
       |                |                |
   PostgreSQL         MariaDB        Management UI
       |
 Photo & Video
   Storage
```

## Key Features

- Private cloud infrastructure hosted on personal hardware.
- Self-hosted photo and video management using Immich.
- File storage and synchronization using Nextcloud.
- Containerized application deployment using Docker.
- Centralized container management through Portainer.
- Secure remote connectivity using Tailscale.
- SSH-based remote server administration.
- Expanded LVM storage capacity.
- Automated Nextcloud backup using shell scripts and cron.

## Repository Structure

```text
self-hosted-homelab/
│
├── README.md
│
├── architecture/
│
├── docker/
│
├── documentation/
│
└── scripts/
```

## Security Considerations

Security is an important part of this project.

- Remote access is configured through Tailscale.
- SSH is used for remote administration.
- Application credentials and database passwords are kept outside the public repository.
- Environment files containing secrets are excluded from version control.
- Backup files and personal data are not published.

## Learning Outcomes

Through this project, I gained practical experience with:

- Linux server administration.
- Ubuntu installation and configuration.
- Docker and container orchestration.
- Docker Compose and Portainer.
- Linux networking and SSH.
- VPN-based remote access.
- Linux filesystem management and LVM.
- Database-backed self-hosted applications.
- Backup automation using Bash and cron.

## Future Improvements

- Infrastructure monitoring and resource utilization dashboards.
- Improved backup and recovery strategy.
- Reverse proxy and HTTPS configuration.
- Additional self-hosted services.
- Infrastructure documentation and deployment automation.

---

**Status:** Active homelab project.

Built and maintained as a hands-on learning project in Linux, networking, Docker, and self-hosted infrastructure.
