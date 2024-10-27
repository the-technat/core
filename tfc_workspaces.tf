resource "tfe_workspace" "cappy" {
  name         = "cappy"
  organization = data.tfe_organization.the-technat.name
  project_id   = tfe_project.cappy.id
  auto_apply   = true
  vcs_repo {
    identifier = "the-technat/cappy"
  }
}
