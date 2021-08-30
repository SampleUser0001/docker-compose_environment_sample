FROM ubuntu

ARG HOGE
ARG PIYO
ARG FUGA
ARG FOO
ARG BAR='bar'

ENV HOGE $HOGE
ENV FUGA $FUGA
ENV BAR $BAR

WORKDIR /app

COPY start.sh /app/start.sh

RUN chmod 755 /app/start.sh

CMD [ "sh" , "/app/start.sh" ]
