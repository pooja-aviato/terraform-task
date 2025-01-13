
provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc_cloud_run" {
  source = "../modules/reusable_infra"

  project_id               = var.project_id
  region                   = var.region
  vpc_name                 = "sample-vpc-pooja"
  subnet_cidrs             = {
    "subnet-1" = "10.0.1.0/24"
    "subnet-2" = "10.0.2.0/24"
    "subnet-3" = "10.0.3.0/24"
  }
  cloud_run_service_name   = "sample-cloud-run"
  cloud_run_image          = "australia-southeast1-docker.pkg.dev/aviato-intern/pooja-docker-repo/sample-image:latest"
  cloud_run_memory         = "1Gi"
  cloud_run_iam_member     = "allUsers"
}
