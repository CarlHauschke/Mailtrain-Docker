FROM ubuntu:14.04

MAINTAINER Carl Hauschke <mail@carl.technology>

EXPOSE 22 \
		80 \
		443 \
		25

RUN apt-get update && \
	apt-get install curl -y \
	curl https://raw.githubusercontent.com/andris9/mailtrain/master/setup/install.sh | sudo bash \
	systemctl disable mailtrain.service \
	rm /etc/systemd/system/mailtrain.service \
	rm /etc/init/mailtrain.conf

WORKDIR /opt/mailtrain


CMD [ "NODE_ENV=production npm start" ]
