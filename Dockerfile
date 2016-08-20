FROM alpine:latest

RUN \
  apk add --update curl postgresql python unzip && \
  curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
  unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
  aws --version && \
  rm -rf /var/cache/apk/*

RUN mkdir -p /backups

ADD docker-entrypoint.sh .

ENTRYPOINT ["./docker-entrypoint.sh"]
