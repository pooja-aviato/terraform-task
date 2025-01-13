variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "The region for the GCP resources"
  type        = string
  default     = "australia-southeast1"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "sample-cloud-run"
}

variable "docker_image_url" {
  description = "The URL of the Docker image in Artifact Registry"
  type        = string
  default = "australia-southeast1-docker.pkg.dev/aviato-intern/pooja-docker-repo/sample-image:latest"
}