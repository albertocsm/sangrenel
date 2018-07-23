FROM alpine:latest

ADD ./docker-entrypoint.sh /
ADD ./sangrenel /usr/local/bin/sangrenel

RUN apk --no-cache add curl ca-certificates

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["sangrenel"]
