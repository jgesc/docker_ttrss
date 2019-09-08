#!/bin/bash
while true
do
	runuser -s /bin/bash www-data -c "php /var/www/html/update.php --daemon"
	echo "Couldn't start daemon. Trying again in 60 seconds."
	sleep 60
done
