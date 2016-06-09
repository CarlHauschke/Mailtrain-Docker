FROM node:6

MAINTAINER Carl Hauschke <mail@carl.technology>

EXPOSE 3000

ONBUILD RUN apt-get update && \
			apt-get install -y git && \
			mkdir -p /usr/src/app

WORKDIR /usr/src/app

ONBUILD RUN cd /usr/src/app && \
			git clone git://github.com/andris9/mailtrain.git /usr/src/app/ && \
			npm install --production && \
			cp config/default.toml config/production.toml


CMD [ "npm", "start", "--production" ]
