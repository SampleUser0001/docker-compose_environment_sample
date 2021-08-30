# docker-compose_environment_sample
docker-compose.ymlで指定したenvirnmentの値がDockerfileで指定しなくてもコンテナ内で使用できることを確認する。

## docker-compose.yml

``` yml
version: '3'
services:
  envs:
    build:
      context: .
      dockerfile: ./Dockerfile
      args:
        FUGA: fuga
        FOO: foo
    container_name: printenv
    environment:
      HOGE: 'hoge'
      PIYO: 'piyo'
    volumes:
      - ./start.sh:/app/start.sh
```

## Dockerfile

``` dockerfile
ARG HOGE
ARG PIYO
ARG FUGA
ARG FOO
ARG BAR='bar'

ENV HOGE $HOGE
ENV FUGA $FUGA
ENV BAR $BAR
```

## 実行結果

```
printenv | HOGE :  hoge
printenv | PIYO :  piyo
printenv | FUGA :  fuga
printenv | FOO : 
printenv | BAR :  bar
```

