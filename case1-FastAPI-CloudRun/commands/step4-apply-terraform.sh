#!/bin/bash

# .envファイルから環境変数を読み込む
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# GITHUB_REF_NAMEを設定（ここでは例としてdevを使用）
GITHUB_REF_NAME="dev"

# terraform/enviroments/devに移動
cd terraform/environments/$GITHUB_REF_NAME

# Terraformに環境変数を渡して実行
terraform apply \
  -var="project_id=$GCP_PROJECT_ID" \
  -var="region=$ARTIFACT_REGISTRY_LOCATION" \
  -var="service_account_name=$GCP_SERVICE_ACCOUNT_NAME"