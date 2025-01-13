
# Cloud Run Setup with Terraform

### Prerequisites
1. **Terraform**: [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. **Google Cloud SDK (gcloud)**: [Installation Guide](https://cloud.google.com/sdk/docs/install)

### Setup Steps

1. Clone the repo:
   ```bash
   git clone https://your-repository-url
   cd cloud-run-terraform
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Create a new GCP project (if needed):
   ```bash
   gcloud projects create <project-id> --name=<project-name>
   ```

4. Enable required APIs:
   ```bash
   gcloud services enable run.googleapis.com cloudbuild.googleapis.com artifactregistry.googleapis.com
   ```

5. Build and push Docker image to Artifact Registry:
   ```bash
   gcloud artifacts repositories create <repo-name> --repository-format=docker --location=us-central1
   docker build -t <region>-docker.pkg.dev/<project-id>/<repo-name>/hello-world:v1 .
   docker push <region>-docker.pkg.dev/<project-id>/<repo-name>/hello-world:v1
   ```

6. Update `variables.tf`:
   - Set `cloud_run_image` to the pushed Docker image.

7. Deploy to Cloud Run:
   ```bash
   terraform apply
   ```

8. Access Cloud Run service at:
   ```
   https://<service-name>-<hash>-uc.a.run.app
   ```

### File Names

- `main.tf`: Terraform configuration for Cloud Run and IAM.
- `variables.tf`: Input variables for configuration.
- `outputs.tf`: Outputs for deployed service URL.
- `README.md`: This file.

### Cleanup

To destroy resources:
```bash
terraform destroy
```

---
    