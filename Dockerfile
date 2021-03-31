FROM node:12-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
## Expose the docker port
EXPOSE 80
## Copy the dist files to NGINX web folder
COPY --from=0 /app/dist /usr/share/nginx/html


