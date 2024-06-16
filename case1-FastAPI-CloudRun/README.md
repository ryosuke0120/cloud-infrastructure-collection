# 設定

1. `.env`を以下の内容で作成する

```bash
# GCP
GCP_PROJECT_ID=your-gcp-project-id
GCP_SERVICE_ACCOUNT_NAME=your-gcp-service-account-name
GCP_REGION=asia-northeast1

# GitHub
GITHUB_REPO_OWNER=your-github-repo-owner
GITHUB_REPO_NAME=your-github-repo-name
```

# ローカル実行

main.py と Dockerfile があるディレクトリで以下のコマンドを実行する

```bash
docker build -t fastapi-cloudrun .
```
