FROM node:6

RUN mkdir -p /usr/app

WORKDIR /usr/app

COPY ./keystone-demo/package.json /usr/app/

RUN npm install
