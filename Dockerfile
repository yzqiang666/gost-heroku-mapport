FROM alpine:3.6

ENV VER=2.11.1
ENV TLS_PORT=4433 PORT=8080

RUN apk add --no-cache curl \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && mv gost_${VER}_linux_amd64 gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE ${TLS_PORT} $PORT




HOST=`echo $SERVER|awk -F ':' '{print $1}'`
PPPP=`echo $SERVER|awk -F ':' '{print $2}'`
[ "$PPPP" == "" ] && PPPP="80"

CMD exec /gost/gost -L=tcp://:$PORT/$HOST:$PPPP -L=tcp://:$TLS_PORT/$HOST:443
