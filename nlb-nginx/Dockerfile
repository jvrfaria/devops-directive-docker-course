FROM nginx:stable-perl

# Use COPY --link to avoid breaking cache if we change the second stage base image
COPY --link nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080