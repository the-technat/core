locals {
  tfc_github_app_installation_id = "ghain-tStMGYgyvrG9Yv7h" # as the README says, this was installed manually
  aws_admin_policy_arn           = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "github_repositories" "all_repos" {
  query           = "org:the-technat"
  include_repo_id = true
}

data "github_repository" "core" {
  full_name = "the-technat/core"
}

data "tfe_organization" "technat" {
  name = "technat"
}

data "aws_caller_identity" "current" {}


data "aws_iam_openid_connect_provider" "tfc" {
  url = "https://app.terraform.io"
}
