terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "core"
    }
  }
  required_providers {
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.17.2"
    }
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "2.2.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.4.0"
    }
    tfe = {
      version = "0.60.1"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.99.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }
  }
}
