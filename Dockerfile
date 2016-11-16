FROM node:latest

# Install ps command
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential \
    curl \
    procps \
    git && \
  apt-get remove -y man && \
  rm -rf /var/lib/apt/lists/*

RUN groupadd -r meteor && useradd -ms /bin/bash -g meteor meteor 
USER meteor
WORKDIR /home/meteor

RUN curl https://install.meteor.com/ | sh

ENV PORT 3000
EXPOSE 3000
WORKDIR /home/meteor/app
ENV HOME /home/meteor
ENV PATH $HOME/.meteor:$PATH

CMD "bash"