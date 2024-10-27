locals {
  tfc_github_app_installation_id = "ghain-tStMGYgyvrG9Yv7h" # as the README says, this was installed manually
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
