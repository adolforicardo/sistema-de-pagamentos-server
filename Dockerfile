FROM node:lts-alpine3.11

WORKDIR /usr/app/server

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 4000

CMD ["npm", "run", "dev"]