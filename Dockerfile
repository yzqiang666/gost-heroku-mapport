FROM alpine:3.6

ENV VER=2.11.1 METHOD=chacha20-ietf-poly1305 PASSWORD=yzqyzq1234
ENV TLS_PORT=4433 PORT=8080

RUN apk add --no-cache curl \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && mv gost_${VER}_linux_amd64 gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE ${TLS_PORT} $PORT
-L=tcp://:$PORT/smccb.tk:800
CMD exec /gost/gost -L=tcp://:$PORT/112.111.100.9:800

