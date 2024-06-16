terraform {
  required_version = ">= 0.14"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.5"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "cloud_run" {
  source       = "../../modules/cloud_run"
  # ロール設定用
  project_id   = var.project_id
  service_account_name = var.service_account_name
  # Cloud Runの設定
  service_name = "my-fastapi-service-dev"
  region       = "asia-northeast1"
  image        = "gcr.io/aihubble/my-fastapi-repo:dev" # この箇所はgithub actionsでビルドしたイメージに自動的に置き換わります
  memory       = "512Mi"
  cpu          = "2"
  environment  = "dev"
  # Artifact Registryの設定
  artifact_repo = "my-fastapi-repo"
}