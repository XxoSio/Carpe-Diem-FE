FROM node:18.13 as builder

RUN mkdir -p /app
WORKDIR /app
ADD . /app/
COPY ./build /app/

RUN ls
RUN rm -rf node_modules && rm -rf package-lock.json || true
RUN pwd
RUN ls

FROM nginx:latest

RUN pwd
RUN rm -rf /etc/nginx/conf.d
COPY conf /etc/nginx

COPY --from=builder /app/secrets /usr/share/nginx
COPY --from=builder /app/build /usr/share/nginx/html
RUN ls  /usr/share/nginx
RUN ls /usr/share/nginx/html

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
