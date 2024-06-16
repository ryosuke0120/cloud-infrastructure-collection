#!/bin/bash

# ----------------------------------------
# .envファイルの読み込みと変数設定
# ----------------------------------------
# .envを読み込む
if [ ! -f .env ]; then
  echo ".env file not found!"
  exit 1
fi

# .envファイルの読み込み
set -a
source .env
set +a

# プロジェクトIDを設定
GCP_PROJECT_ID="${GCP_PROJECT_ID}"
GCP_REGION="${GCP_REGION}"
SERVICE_NAME="${SERVICE_NAME}"
GCP_SA_KEY=$(cat "service-account-key.json")

# GitHub Secretsのアップロード
gh secret set GCP_PROJECT_ID -b"${GCP_PROJECT_ID}" --repo "${REPO}"
gh secret set GCP_REGION -b"${GCP_REGION}" --repo "${REPO}"
gh secret set SERVICE_NAME -b"${SERVICE_NAME}" --repo "${REPO}"
gh secret set GCP_SA_KEY -b"${GCP_SA_KEY}" --repo "${REPO}"

echo "GitHub Secrets have been uploaded."
