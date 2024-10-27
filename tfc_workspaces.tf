resource "tfe_workspace" "cappy" {
  name              = "cappy"
  organization      = data.tfe_organization.technat.name
  project_id        = tfe_project.cappy.id
  auto_apply        = true
  working_directory = "mgmt_cluster"
  terraform_version = "1.9.8"
  vcs_repo {
    identifier                 = "the-technat/cappy"
    github_app_installation_id = local.tfc_github_app_installation_id
  }
}
