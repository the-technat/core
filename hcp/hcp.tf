### Hashicorp Cloud
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "hcp"
    }
  }
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.99.0"
    }
  }
}

provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id    = "15fd266b-b556-4ea4-89e2-8232dc363b30" # the default project named core
}

provider "hcp" {
  alias         = "hcp_wunschliste"
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id    = hcp_project.wunschliste.resource_id
}

data "hcp_service_principal" "core" {
  resource_name = "iam/organization/06a1a939-ba11-4b3b-97a5-f44ce781e88b/service-principal/core"
}

variable "hcp_client_id" {
  type        = string
  sensitive   = true
  description = "HCP Client ID, provided by TFC"
}

variable "hcp_client_secret" {
  type        = string
  sensitive   = true
  description = "HCP Client Secret, provided by TFC"
}
