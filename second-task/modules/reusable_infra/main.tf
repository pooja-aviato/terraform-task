# Provider Configuration
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create VPC
resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

# Create Subnets
resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnet_cidrs

  name          = each.key
  ip_cidr_range = each.value
  network       = google_compute_network.vpc_network.id
  region        = var.region
}

# Create Cloud Run Service
resource "google_cloud_run_service" "cloud_run" {
  name     = var.cloud_run_service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.cloud_run_image
        resources {
          limits = {
            memory = var.cloud_run_memory
          }
        }
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