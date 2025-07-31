FROM alpine:latest

LABEL maintainer="Arnob Almazee <github.com@arn-ob>"

RUN apk add --no-cache curl

RUN wget https://github.com/digitalocean/doctl/releases/download/v1.135.0/doctl-1.135.0-linux-amd64.tar.gz

RUN tar -xf doctl-1.135.0-linux-amd64.tar.gz -C ~/

RUN chmod +x ~/doctl

RUN mv ~/doctl /usr/local/bin

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/` curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]