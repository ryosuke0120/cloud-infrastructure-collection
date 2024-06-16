variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "service_account_name" {
  description = "The name of the Cloud Run service account"
  type        = string
}

variable "region" {
  description = "The region where the Cloud Run service will be deployed"
  type        = string
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "image" {
  description = "The container image to deploy"
  type        = string
}

variable "memory" {
  description = "Memory limit for the container"
  type        = string
  default     = "256Mi"
}

variable "cpu" {
  description = "CPU limit for the container"
  type        = string
  default     = "1"
}

variable "environment" {
  description = "The environment (dev, stg, prd)"
  type        = string
}

variable "artifact_repo" {
  description = "The name of the Artifact Registry repository"
  type        = string
}