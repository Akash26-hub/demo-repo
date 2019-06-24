FROM devopsedu/webapp:latest

COPY index.php /var/www/html/index.php
COPY devops-webapp-1.0-SNAPSHOT.jar /tmp/test.jar