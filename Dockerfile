FROM debian:latest

RUN apt update
RUN apt install wget curl gpg -y

RUN echo 'deb http://download.opensuse.org/repositories/home:/m-grant-prg/Debian_11/ /' | tee /etc/apt/sources.list.d/home:m-grant-prg.list
RUN curl -fsSL https://download.opensuse.org/repositories/home:m-grant-prg/Debian_11/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_m-grant-prg.gpg > /dev/null
RUN apt update
RUN apt install get-iplayer -y

RUN wget -O ./get_iplayer.cgi https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer.cgi
RUN install -m 755 ./get_iplayer.cgi /usr/local/bin

VOLUME output
VOLUME config

EXPOSE 1935:1935

CMD get_iplayer.cgi -p 1935
