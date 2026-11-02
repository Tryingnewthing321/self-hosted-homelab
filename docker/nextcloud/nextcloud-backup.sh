
#!/bin/bash

set -e
umask 077

DATE=$(date +%F-%H-%M)
BACKUP_DIR="/srv/backups/$DATE"

mkdir -p "$BACKUP_DIR"

echo "Starting Nextcloud backup..."

# Enable maintenance mode
docker exec -u www-data nextcloud php occ maintenance:mode --on

# Disable maintenance mode when script exits
cleanup() {
    docker exec -u www-data nextcloud php occ maintenance:mode --off || true
}
trap cleanup EXIT

# Backup Nextcloud files
docker run --rm \
    -v nextcloud_nextcloud_data:/data:ro \
    -v "$BACKUP_DIR":/backup \
    alpine \
    tar czf /backup/nextcloud-data.tar.gz -C /data .

# Backup MariaDB database
docker exec nextcloud-db sh -c '
    mariadb-dump \
        --user="$MYSQL_USER" \
        --password="$MYSQL_PASSWORD" \
        --single-transaction \
        "$MYSQL_DATABASE"
' > "$BACKUP_DIR/nextcloud-db.sql"

echo "Backup completed: $BACKUP_DIR"

