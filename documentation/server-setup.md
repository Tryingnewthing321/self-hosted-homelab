# Homelab Server Setup

## 1. Introduction

This document describes the hardware and initial configuration of my self-hosted homelab server.

The server is built using an old Lenovo laptop running Ubuntu Server 24.04 LTS. It acts as the host machine for multiple self-hosted applications deployed through Docker.

## 2. Hardware Configuration

| Component | Details |
|---|---|
| Host machine | Lenovo laptop |
| Storage | Approximately 1 TB |
| Operating System | Ubuntu Server 24.04 LTS |
| Network | Local network with remote access |

## 3. Operating System Installation

Ubuntu Server 24.04 LTS was installed using a bootable USB drive.

### Installation process

1. Download the Ubuntu Server ISO.
2. Create a bootable USB using Rufus.
3. Connect the USB drive to the Lenovo laptop.
4. Boot the laptop using the USB device.
5. Select Ubuntu Server installation.
6. Configure the hostname, username and network.
7. Configure disk partitioning and complete installation.
8. Restart the system and remove the USB drive.

## 4. Initial Server Configuration

After installation, the following initial configuration was performed:

- Updated Ubuntu packages.
- Configured SSH for remote administration.
- Installed Docker Engine.
- Installed Docker Compose.
- Configured persistent storage directories.
- Configured Tailscale for remote connectivity.

## 5. Storage Configuration

The server uses Logical Volume Manager (LVM) for storage management.

The root logical volume was expanded to use the available volume group space.

Final root filesystem capacity: approximately 914 GB.

## 6. Application Deployment

The following applications were deployed:

| Application | Purpose |
|---|---|
| Immich | Photo and video management |
| Nextcloud | Private cloud storage |
| Portainer CE | Docker container management |

Docker containers are used to isolate and manage the applications and their supporting services.

## 7. Remote Access

Tailscale provides secure remote connectivity to the server.

SSH is used for command-line administration, while the web interfaces of the self-hosted applications can be accessed remotely through the private network.

## 8. Backup Configuration

A scheduled Nextcloud backup script is configured using cron.

The backup process is documented separately in `backup-configuration.md`.

## 9. Project Status

The core server infrastructure and application deployments are operational.

Future work includes improved monitoring, backup validation, security hardening and additional infrastructure documentation.
