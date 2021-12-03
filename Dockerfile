FROM node:lts-alpine

WORKDIR /data/

COPY package.json package-lock.json /data/

RUN npm install

COPY * /data/

ENTRYPOINT ["npm", "start"]