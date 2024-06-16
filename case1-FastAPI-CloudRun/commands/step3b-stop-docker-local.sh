#!/bin/bash

# コンテナを停止
docker stop my_fastapi_container

# コンテナを削除
docker rm my_fastapi_container

# イメージを削除（必要に応じて）
docker rmi my_fastapi_app
