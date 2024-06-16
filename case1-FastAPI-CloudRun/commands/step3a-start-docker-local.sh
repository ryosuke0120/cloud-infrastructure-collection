#!/bin/bash

# Dockerイメージをビルド
docker build -t my_fastapi_app .

# Dockerコンテナを実行
docker run -d --name my_fastapi_container -p 80:80 my_fastapi_app

# コンテナのログを表示
docker logs -f my_fastapi_container