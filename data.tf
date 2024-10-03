data "github_repositories" "all_repos" {
  query           = "org:the-technat"
  include_repo_id = true
}

data "github_repository" "core" {
  full_name = "the-technat/core"
}

data "tfe_organization" "the-technat" {
  name = "the-technat"
}
