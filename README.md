# docker-compose_environment_sample
docker-compose.ymlで指定したenvirnmentの値がDockerfileで指定しなくてもコンテナ内で使用できることを確認する。

## 実行結果

1. docker-compose.yml -> build.args -> ARG はコンテナに渡らない。
2. docker-compose.yml -> build.args -> ENV はコンテナに渡らない。
3. docker-compose.yml -> environment -> ARG はコンテナに渡る。
4. docker-compose.yml -> environment -> ENV はコンテナに渡る。
5. docker-compose.yml -> build.args -> ARG -> ENV はコンテナに渡る。
6. docker-compose.yml -> build.args -> ARG -> ARG はコンテナに渡らない。
7. docker-compose.yml -> build.args -> ENV -> ARG はコンテナに渡らない。
8. docker-compose.yml -> build.args -> ENV -> ENV はコンテナに渡らない。
  - Dockerfile内でENVで定義された値をDockerfile内で呼べていない？


## docker-compose.yml

``` yml
version: '3'
services:
  envs:
    build:
      context: .
      dockerfile: ./Dockerfile
      args:
        V01a: v01
        V02a: v02
        V03a: v03
        V04a: v04
        V05a: v05
        V06a: v06
    container_name: printenv
    environment:
      V11a: 'v11'
      V12a: 'v12'
      V13a: 'v13'
      V14a: 'v14'
      V15a: 'v15'
      V16a: 'v16'
    volumes:
      - ./start.sh:/app/start.sh
```

## Dockerfile

``` dockerfile
ARG V01a
ARG V02a
ARG V03a
ENV V04a $V04a
ENV V05a $V05a
ENV V06a $V06a
ARG V11a
ARG V12a
ARG V13a
ENV V14a $V14a
ENV V15a $V15a
ENV V16a $V16a

ARG V01b $V01a
ENV V02b $V02a

ARG V04b $V04a
ENV V05b $V05a

ARG V11b $V11a
ENV V12b $V12a

ARG V14b $V14a
ENV V15b $V15a

ARG V21='v21'
ENV V31='v31'
```

## 実行結果

```
printenv | V01a : 
printenv | V02a : 
printenv | V03a : 
printenv | V04a : 
printenv | V05a : 
printenv | V06a : 
printenv | V11a :  v11
printenv | V12a :  v12
printenv | V13a :  v13
printenv | V14a :  v14
printenv | V15a :  v15
printenv | V16a :  v16
printenv | V01b : 
printenv | V02b :  v02
printenv | V03b : 
printenv | V04b : 
printenv | V05b : 
printenv | V06b : 
printenv | V11b : 
printenv | V12b : 
printenv | V13b : 
printenv | V14b : 
printenv | V15b : 
printenv | V16b : 
printenv | V21 : 
printenv | V31 :  v31
```

