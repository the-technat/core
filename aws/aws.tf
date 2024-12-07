terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.78.0"
    }
  }
}

provider "aws" {
  region = "eu-central-2"
}

locals {
  aws_admin_policy_arn           = "arn:aws:iam::aws:policy/AdministratorAccess"
  github_issuer_url              = "https://token.actions.githubusercontent.com"
}

data "aws_caller_identity" "current" {}

data "aws_iam_openid_connect_provider" "tfc" {
  url = "https://app.terraform.io"
}