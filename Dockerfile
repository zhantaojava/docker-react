FROM node:alpine as builder

WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .

RUN npm run build

FROM nginx
EXPOSE 80

#copy from builder  to nginx
COPY --from=0 /app/build  /usr/share/nginx/html