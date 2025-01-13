output "vpc_name" {
  description = "Name of the VPC"
  value       = google_compute_network.vpc_network.name
}

output "subnet_names" {
  description = "Names of the created subnets"
  value       = [for s in google_compute_subnetwork.subnets : s.name]
}

output "cloud_run_url" {
  description = "Cloud Run service URL"
  value       = google_cloud_run_service.cloud_run.status[0].url
}
