# Terraform VPC, Subnets, and Cloud Run Module

## Overview
This module provides a reusable solution to set up key infrastructure components on Google Cloud Platform (GCP), including a Virtual Private Cloud (VPC), subnets, and a Cloud Run service. It allows for flexibility in configuration and adheres to Terraform best practices.

## Steps to Use the Module

1. **Prepare Your Terraform Configuration**:
   - Add the module source path in your Terraform configuration.
   - Define the required input parameters, including the VPC name, subnet CIDRs, and Cloud Run service details (e.g., name, image, memory).

2. **Define Input Variables**:
   - Specify the VPC CIDR and subnet CIDRs in a map format.
   - Provide the Docker image for the Cloud Run service.
   - Set IAM members for the Cloud Run invoker role if needed.

3. **Apply the Configuration**:
   - Run `terraform init` to initialize the working directory.
   - Use `terraform plan` to preview the changes.
   - Execute `terraform apply` to create the resources.

4. **Access Outputs**:
   - After successful deployment, retrieve the output values such as the VPC name, created subnets, and the Cloud Run service URL.

## Module Features
- **VPC Creation**: Sets up a customizable VPC with user-defined name and CIDR blocks.
- **Subnet Provisioning**: Supports creating multiple subnets with specified CIDRs.
- **Cloud Run Deployment**: Deploys a Cloud Run service with configurable memory allocation, Docker image, and traffic settings.
- **IAM Role Management**: Grants the `roles/run.invoker` role to specified IAM members.

## Best Practices Followed
- Input validation for required variables.
- Output variables for easy access to deployed resource details.
- Comprehensive documentation to simplify usage and integration.

## Next Steps
- Integrate the module into your existing Terraform configurations.
- Customize the input parameters to fit your infrastructure requirements.
- Run Terraform commands to deploy and manage your infrastructure efficiently.

Refer to the provided examples and documentation for detailed usage instructions.
