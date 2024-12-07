### Github
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "gh"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.4.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.99.0"
    }
  }
}

provider "github" {
  token = var.github_token
}

provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id = "15fd266b-b556-4ea4-89e2-8232dc363b30" # the default project named core
}

data "github_repositories" "all_repos" {
  query           = "org:the-technat"
  include_repo_id = true
}

data "github_repository" "core" {
  full_name = "the-technat/core"
}

variable "hcp_client_id" {
  type        = string
  sensitive   = true
  description = "HCP Client ID, provided by TFC workspace"
}

variable "hcp_client_secret" {
  type        = string
  sensitive   = true
  description = "HCP Client Secret, provided by TFC workspace"
}

variable "github_token" {
  type        = string
  sensitive   = true
  description = "The only GH PAT created manually, provided by TFC"
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
data "terraform_remote_state" "az" {
  backend = "remote"
  config = {
    organization = "technat"
    workspaces = {
      name = "az"
    }
  }
}