### Terraform Cloud
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "tfc"
    }
  }
  required_providers {
    tfe = {
      version = "0.59.0"
    }
  }
}

provider "tfe" {
  token = var.tfc_token
}

variable "tfc_token" {
  type        = string
  sensitive   = true
  description = "Terraform Cloud token, provided by TFC"
}

locals {
  tfc_github_app_installation_id = "ghain-tStMGYgyvrG9Yv7h" # as the README says, this was installed manually
}

data "tfe_organization" "technat" {
  name = "technat"
}

data "terraform_remote_state" "aws" {
  backend = "remote"

  config = {
    organization = "technat"
    workspaces = {
      name = "aws"
    }
  }
}
data "terraform_remote_state" "hcp" {
  backend = "remote"

  config = {
    organization = "technat"
    workspaces = {
      name = "hcp"
    }
  }
}

data "tfe_workspace" "gh" {
  name         = "gh"
  organization = "technat"
}