#---- TURN ON MAINTENANCE MODE 

cd /var/www/html/<nextcloud-folder>  
sudo -u www-data php occ maintenance:mode --on   
#---- LOGIN TO MYSQL DATABASE  
sudo mysql   
#---- Verify Nextcloud DB  
show databases;   
use nextcloud;   
show tables;   
exit   
#---- BACKUP DATABASE WITH THE ROOT USER   
su -

mkdir /var/backups/nextcloud_$(date +"%Y-%m-%d\_%H-%M-%S")  
mysqldump --databases nextcloud > /var/backups/nextcloud_path_created_above/nextcloud_backup_$(date +"%Y-%m-%d\_%H-%M-%S").sql

#---- BACKUP THE ENTIRE NEXTCLOUD FOLDER   
cd /var/www   
rsync -Aavx /nextcloud/directory/ /path/to/backup/nextcloud-dirbkp\_$(date +"%Y-%m-%d\_%H-%M-%S")/  
#---- CHANGE DIRECTORY TO THE NEXTCLOUD DIR, RUN THE UPDATER  
sudo -u www-data php /var/www/nextcloud/updater/updater.phar

##AFTER PRESSING "Y", IF THERE IS AN ERROR MOVE OUT THE CONFLICTING FILES  
Then turn off maintainance mode off  
sudo -u www-data php occ maintenance:mode --off
