FROM node:6

MAINTAINER Carl Hauschke <mail@carl.technology>

EXPOSE 3000

RUN apt-get update \
	apt-get install -y git \
	mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN 
	cd /usr/src/app \
	git clone git://github.com/andris9/mailtrain.git /media/build-mailtrain/ \
	npm install --production \
	cp config/default.toml config/production.toml \


CMD [ "npm", "start" ]