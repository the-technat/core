### Hetzner DNS
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "dns"
    }
  }
  required_providers {
    hetznerdns = {
      source  = "germanbrew/hetznerdns"
      version = "3.3.1"
    }
  }
}

provider "hetznerdns" {
  api_token = var.hetzner_dns_token
}

variable "hetzner_dns_token" {
  type        = string
  sensitive   = true
  description = "API Token for Hetzner DNS, provided by TFC"
}