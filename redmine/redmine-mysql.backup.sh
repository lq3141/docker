## redmine backup and restore
# https://www.redmine.org/projects/redmine/wiki/RedmineBackupRestore

backup_fn=redmine_`date +%Y-%m-%d`.gz

# Database
mysqldump -u redmine -predmine redmine | gzip > /root/$backup_fn

## Attachments
#rsync -a /path/to/redmine/files /path/to/backup/files
