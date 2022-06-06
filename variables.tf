variable "gcp_private_key" { 
  type = string 
} 

variable "gcp_cred" { 
  type = map 
} 

locals {
  credential = merge(var.gcp_cred, {private_key = "var.gcp_private_key"}) 
} 

variable "project_id" {
  description = "Google Cloud Platform (GCP) Project ID."
  type        = string
  default     = "silicon-coder-316218"
}

variable "region" {
  description = "GCP region name."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone name."
  type        = string
  default     = "us-central1-b"
}

variable "name" {
  description = "Web server name."
  type        = string
  default     = "my-webserver"
}

variable "machine_type" {
  description = "GCP VM instance machine type."
  type        = string
  default     = "n1-standard-1"
}
