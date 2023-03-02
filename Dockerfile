FROM nginx:latest

RUN mkdir -p /app
WORKDIR /app
ADD . /app/

RUN pwd
RUN ls
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx

RUN ls  /usr/share/nginx
RUN ls /usr/share/nginx/html

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
