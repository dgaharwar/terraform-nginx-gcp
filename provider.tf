terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.84.0"
    }
  }
}

# Specify the GCP Provider
provider "google" {
  project = var.project_id
  region  = var.region
  credentials = jsonencode(local.credential)
}

