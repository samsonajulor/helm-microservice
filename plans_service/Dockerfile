FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install

COPY . .

EXPOSE 3991

CMD ["yarn", "start"]
