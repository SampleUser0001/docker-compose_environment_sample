# docker-compose_environment_sample
docker-compose.ymlで指定したenvirnmentの値がDockerfileで指定しなくてもコンテナ内で使用できることを確認する。

## 実行結果

### 概要

1. docker-compose.yml -> environmentで指定した値はコンテナに渡される。
2. docker-compose.yml -> build.argsで指定した値はコンテナに渡されない。
3. docker-compose.yml -> environmentで指定した値はDockerfileのARGで取得できない。
4. docker-compose.yml -> build.argsで指定した値はDockerfileのARGで取得できる。


### 詳細

1. docker-compose.yml -> build.args -> ARG はコンテナに渡らない。
2. docker-compose.yml -> build.args -> ENV はコンテナに渡らない。
3. docker-compose.yml -> environment -> ARG はコンテナに渡る。
4. docker-compose.yml -> environment -> ENV はコンテナに渡る。
5. docker-compose.yml -> build.args -> ARG -> ENV はコンテナに渡る。
6. docker-compose.yml -> build.args -> ARG -> ARG はコンテナに渡らない。
7. docker-compose.yml -> build.args -> ENV -> ARG はコンテナに渡らない。
8. docker-compose.yml -> build.args -> ENV -> ENV はコンテナに渡らない。
  - Dockerfile内でENVで定義された値をDockerfile内で呼べていない？
9. docker-compose.yml -> build.args はコンテナに渡らない。
10. docker-compose.yml -> environment はコンテナに渡る。
