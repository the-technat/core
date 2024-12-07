### Hetzner DNS
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "core"
    }
  }
  required_providers {
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "2.2.0"
    }
  }
}

provider "hetznerdns" {
  apitoken = var.hetzner_dns_token
}

variable "hetzner_dns_token" {
  type        = string
  sensitive   = true
  description = "API Token for Hetzner DNS, provided by TFC"
}