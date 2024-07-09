FROM debian:stable-slim
FROM --platform=linux/amd64  python:3.9

RUN apt-get update
RUN apt-get install -yy wget curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
	apt-get update && apt-get install -y nodejs && \
  npm i -g npm@10

RUN node -v && npm -v

RUN apt-get install -y wget
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable
RUN npm -v
RUN apt update && apt install -y procps
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*
