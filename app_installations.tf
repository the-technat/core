resource "github_app_installation_repositories" "the-technat-renovate" {
  # The installation id of the app (in the organization).
  installation_id       = "1014986" # self-hosted renovate app
  selected_repositories = data.github_repositories.all_repos.full_names
}
