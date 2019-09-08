#!/bin/bash
while true
do
	su -s /bin/bash www-data -c "php /var/www/html/update_daemon2.php"
	sleep 120
done
