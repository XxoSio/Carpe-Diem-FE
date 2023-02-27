FROM node:18.13

RUN mkdir -p /app
WORKDIR /app
ADD . /app/

RUN rm -rf node_modules && rm -rf package-lock.json || true
RUN yarn i
RUN npm run build
RUN pwd
RUN ls

FROM nginx:latest

RUN pwd
RUN ls
RUN cat /etc/nginx/conf.d
RUN cat /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]