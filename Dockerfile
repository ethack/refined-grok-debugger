FROM node:18 AS builder

WORKDIR /app
COPY . .
RUN rm -rf node_modules build

RUN npm install --production
RUN npm run build

FROM caddy:alpine

COPY --from=builder /app/build/ /usr/share/caddy/

EXPOSE 80
