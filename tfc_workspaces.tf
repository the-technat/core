resource "tfe_workspace" "cappy" {
  name         = "cappy"
  organization = data.tfe_organization.technat.name
  project_id   = tfe_project.cappy.id
  auto_apply   = true
  vcs_repo {
    identifier = "the-technat/cappy"
    github_app_installation_id = local.tfc_github_app_installation_id
  }
}
