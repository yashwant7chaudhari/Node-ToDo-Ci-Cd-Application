#stage1

FROM node:12.2.0-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . /app

#stage2

FROM nginx:stable-alpine
COPY --from=build /app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
