FROM devopsedu/webapp:latest

COPY index.php /var/www/html/index.php
COPY devops-webapp-1.0-SNAPSHOT-jar-with-dependencies.jar /tmp/test.jar

RUN apt update && \
    apt install -y php

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]