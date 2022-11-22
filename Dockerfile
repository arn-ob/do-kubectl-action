FROM ubuntu:latest

LABEL maintainer="Arnob Almazee <github.com@arn-ob>"

RUN curl -LO https://github.com/digitalocean/doctl/releases/download/v1.84.0/doctl-1.84.0-linux-amd64.tar.gz

RUN tar -xzf ~/doctl-1.84.0-linux-amd64.tar.gz

RUN chmod +x ./doctl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]