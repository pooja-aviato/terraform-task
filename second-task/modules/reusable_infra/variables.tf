# VPC Variables
variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default = "aviato-intern"
}

variable "region" {
  description = "Region for resources"
  type        = string
  default = "australia-southeast1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default = "sample-vpc-pooja"
}

variable "subnet_cidrs" {
  description = "Map of subnets with their CIDR blocks"
  type        = map(string)
  default     = {
    "subnet-1" = "10.0.1.0/24"
    "subnet-2" = "10.0.2.0/24"
    "subnet-3" = "10.0.3.0/24"
  }
}

# Cloud Run Variables
variable "cloud_run_service_name" {
  description = "Name of the Cloud Run service"
  type        = string
  default = "sample-cloud-run"
}

variable "cloud_run_image" {
  description = "Container image URL for Cloud Run"
  type        = string
  default = "australia-southeast1-docker.pkg.dev/aviato-intern/pooja-docker-repo/sample-image:latest"
}

variable "cloud_run_memory" {
  description = "Memory allocation for Cloud Run service"
  type        = string
  default     = "512Mi"
}

variable "cloud_run_iam_member" {
  description = "IAM member to grant roles/run.invoker"
  type        = string
  default = "allUsers"
}
