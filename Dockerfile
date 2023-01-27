FROM node:18-alpine as builder

WORKDIR /home/node/app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /home/node/app/build /usr/share/nginx/html
