#!/bin/bash
# === START TIME ===
START_TIME=$(date +"%Y-%m-%d_%H-%M-%S")

echo $START_TIME
sleep 3

# === CONFIGURATION ===
NEXTCLOUD_DIR="/var/www/tundenextcloud.datanotchconsulting.com"           # Change if your Nextcloud dir is different
BACKUP_DIR="/var/backups"                         # Base directory for backups
BACKUP_NAME="nextcloud_${START_TIME}"
DB_NAME="nextcloud"                               # Your Nextcloud database name
NC_USER="www-data"                                # User that runs the web server
MYSQL_USER="root"
BACKUP_FILE="/home/tunde/nextcloud/${DB_NAME}_backup${START_TIME}.sql"

# === TURN ON MAINTENANCE MODE ===
echo "Turning on maintenance mode..."
sudo -u $NC_USER php $NEXTCLOUD_DIR/occ maintenance:mode --on || { echo "Failed to enable maintenance mode"; exit 1; }

sleep 3

# === VERIFY NEXTCLOUD DATABASE ===
echo "Verifying MySQL database '$DB_NAME'..."
sudo mysql -u $MYSQL_USER -e "SHOW DATABASES;" | grep -q $DB_NAME || { echo "Database $DB_NAME not found!"; exit 1; }

sleep 3
# === BACKUP DATABASE ===
echo "Backing up MySQL database..."
if [ ! -d "$BACKUP_DIR/$DB_NAME/$BACKUP_NAME/" ]; then
  echo "Creating backup directory: $BACKUP_DIR/$DB_NAME"
  sudo mkdir -p "$BACKUP_DIR/$DB_NAME/$BACKUP_NAME" || { echo "Failed to create backup directory!"; exit 1; }
fi

# Dump the database
sudo mysqldump -u "$MYSQL_USER" "$DB_NAME" > "$BACKUP_FILE" || { echo "Database backup failed!"; exit 1; }

# Copy to /var/backups
sudo cp "$BACKUP_FILE" "$BACKUP_DIR/$DB_NAME/$BACKUP_NAME" || { echo "Copy to /var/backups failed!"; exit 1; }

echo "COPY DONE"

rm -rf $BACKUP_FILE

sleep 4
# === BACKUP NEXTCLOUD DIRECTORY ===
echo "Backing up Nextcloud directory..."
sudo rsync -Aavx $NEXTCLOUD_DIR/ "$BACKUP_DIR/$DB_NAME/$BACKUP_NAME/" || { echo "Directory backup failed!"; exit 1; }

# === CLEANUP OLD LOG FILE IF EXISTS ===
LOG_FILE="$NEXTCLOUD_DIR/nextcloud.log"
if [ -f "$LOG_FILE" ]; then
  echo "Removing old nextcloud.log..."
  sudo rm -f "$LOG_FILE"
fi

sleep 2
# === RUN THE UPDATER ===
echo "Running updater..."
sudo -u $NC_USER php $NEXTCLOUD_DIR/updater/updater.phar || { echo "Updater encountered an error. Please check and resolve conflicts manually."; exit 1; }

sleep 5
# === TURN OFF MAINTENANCE MODE ===
echo "Turning off maintenance mode..."
sudo -u $NC_USER php $NEXTCLOUD_DIR/occ maintenance:mode --off || { echo "Failed to disable maintenance mode"; exit 1; }

echo "Nextcloud update complete. Backup saved in: $BACKUP_DIR/$BACKUP_NAME"
