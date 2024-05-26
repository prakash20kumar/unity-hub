# Use the official Node.js 14 image as the base image
FROM node:14-alpine

# Working directory be app
WORKDIR /usr/src/app

COPY package*.json ./

###  Installing dependencies

RUN npm install --silent

# copy local files to app folder
COPY . .

EXPOSE 3000

CMD ["npm","start"]