FROM vitrivr/adampro:2.0-selfcontained

# get and build cineast
RUN cd /; git clone --branch 2.0.0 https://github.com/vitrivr/cineast.git cineast; cd cineast; ./gradlew deploy


#get and build Vitrivr NG
RUN cd /; curl -sL https://deb.nodesource.com/setup_8.x | bash - ; apt-get install -y nodejs; git clone --branch v1.0.2 https://github.com/vitrivr/vitrivr-ng.git vitrivr-ng; cd vitrivr-ng; npm set progress=false; npm install --unsafe-perm -g @angular/cli; npm install -s; ng build -prod --no-progress


#setup apache
RUN apt-get -y install apache2; cp -r /vitrivr-ng/dist/* /var/www/html/
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
COPY vitrivr-ng.json /var/www/html/config.json
RUN a2enmod rewrite


#expose ports
EXPOSE 80
EXPOSE 4567
EXPOSE 4568

#perpare start
COPY start.sh /start_vitrivr.sh
RUN chown root.root /start_vitrivr.sh; chmod 700 /start_vitrivr.sh; apt-get install -y tmux
ENTRYPOINT ["/start_vitrivr.sh"]
