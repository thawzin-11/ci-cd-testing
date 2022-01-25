FROM node:12.21.0-alpine AS build

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . .



FROM node:12.21.0-alpine AS main

WORKDIR /app

COPY --from=build /app /app

EXPOSE 4000

CMD npm run seeddb && npm run start