terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region  
}

resource "google_cloud_run_service" "cloud_run" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.docker_image_url
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# IAM for Cloud Run
resource "google_cloud_run_service_iam_member" "public_access" {
  project        = var.project_id
  location       = var.region
  service        = google_cloud_run_service.cloud_run.name
  role           = "roles/run.invoker"
  member         = "allUsers"
}

output "url" {
  value = google_cloud_run_service.my_service.status[0].url
}