FROM node:12-alpine as BUILD
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ng build

FROM nginx
EXPOSE 80
COPY --from=BUILD /app/dist /usr/share/nginx/html
