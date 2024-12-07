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
  }
}


provider "github" {
  token = var.github_token
}

data "github_repositories" "all_repos" {
  query           = "org:the-technat"
  include_repo_id = true
}

data "github_repository" "core" {
  full_name = "the-technat/core"
}

### Github
variable "github_token" {
  type        = string
  sensitive   = true
  description = "The only GH PAT created manually, provided by TFC"
}