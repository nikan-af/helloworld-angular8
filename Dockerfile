FROM node:12-alpine as BUILD
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
## Copy the dist files to NGINX web folder
COPY --from=BUILD /app/dist /usr/share/nginx/html
## Expose the docker port
EXPOSE 80

