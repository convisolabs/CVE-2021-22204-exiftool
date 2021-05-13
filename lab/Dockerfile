FROM debian:latest

EXPOSE 80

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN apt -qy update \
    && apt list --upgradable \
    && apt -qy upgrade \
    && apt install -qy curl \
                      make \
                      gcc \
                      perl \
                      libwww-perl \
    && apt clean \
  	&& apt -y autoremove


RUN cpan install Mojolicious::Lite Image::ExifTool UUID::Tiny

CMD ["perl", "application.pl", "daemon", "-m", "production", "-l", "http://*:80"]