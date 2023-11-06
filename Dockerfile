FROM nginx:stable

RUN apt-get -y update && apt-get -y install wget

RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O /usr/local/sbin/install-ngxblocker
RUN chmod +x /usr/local/sbin/install-ngxblocker

WORKDIR /usr/local/sbin

RUN ./install-ngxblocker -x

WORKDIR /

COPY nginx.conf /etc/nginx/

EXPOSE 9090

CMD ["nginx", "-g", "daemon off;"]

