FROM alpine:3.6

ENV VER=2.11.1

RUN apk add --no-cache curl \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && mv gost_${VER}_linux_amd64 gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE  $PORT



CMD exec  /gost/gost -L=tcp://:$PORT/$SERVER




