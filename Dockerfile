FROM nginx:stable-alpine

RUN rm /etc/nginx/conf.d/*
COPY nginx.conf /etc/nginx/conf.d/reposado.conf

EXPOSE 80
