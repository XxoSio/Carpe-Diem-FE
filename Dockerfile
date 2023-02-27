FROM node:18.13

RUN mkdir -p /app
WORKDIR /app
ADD . /app/

RUN rm -rf node_modules && rm -rf package-lock.json || true
RUN yarn i
RUN npm run build

FROM nginx:latest

RUN pwd
RUN ls
RUN ls /etc/nginx
RUN ls /etc/nginx/sites-available
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]