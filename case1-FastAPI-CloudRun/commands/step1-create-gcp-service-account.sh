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
PROJECT_ID="${GCP_PROJECT_ID}"
SERVICE_NAME="${GCP_SERVICE_ACCOUNT_NAME}"
REGION="${GCP_REGION}"

# ----------------------------------------
# アプリケーションデフォルトの認証情報を設定
# ----------------------------------------
echo "Setting up application default credentials..."
gcloud auth application-default login

# プロジェクトを設定
echo "Setting project to $PROJECT_ID"
gcloud config set project $PROJECT_ID

# ----------------------------------------
# サービスアカウントの作成
# ----------------------------------------
# サービスアカウントのメールアドレスを取得
SERVICE_ACCOUNT_EMAIL="$SERVICE_NAME@$PROJECT_ID.iam.gserviceaccount.com"

# サービスアカウントの作成
gcloud iam service-accounts create $SERVICE_NAME \
  --description="Service account for deploying to Cloud Run" \
  --display-name="Cloud Run Deployer"

# ----------------------------------------
# サービスアカウントのロール付与
# ----------------------------------------
# IAMサービスアカウントユーザーロールの付与
gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:$SERVICE_ACCOUNT_EMAIL" \
  --role="roles/iam.serviceAccountUser"

# ----------------------------------------
# サービスアカウントキーの作成
# ----------------------------------------
# サービスアカウントキーを作成し、JSONファイルとしてダウンロード
gcloud iam service-accounts keys create service-account-key.json \
  --iam-account $SERVICE_ACCOUNT_EMAIL
