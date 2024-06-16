resource "google_artifact_registry_repository" "repo" {
  provider    = "google-beta"
  project     = var.project_id
  location    = var.region
  repository_id = var.artifact_repo
  format      = "DOCKER"
}

resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
        resources {
          limits = {
            memory = var.memory
            cpu    = var.cpu
          }
        }
        env {
          name  = "ENV"
          value = var.environment
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_project_iam_member" "run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${var.service_account_name}@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_project_iam_binding" "artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"

  members = [
    "serviceAccount:${google_cloud_run_service.default.name}@${var.project_id}.iam.gserviceaccount.com"
  ]
}