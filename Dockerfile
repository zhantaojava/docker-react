FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx

#copy from builder  to nginx
COPY --from=builder /app/build  /usr/share/nginx/html