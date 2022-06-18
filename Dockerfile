# building step
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# nginx
# all we need is un folder /app/build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
