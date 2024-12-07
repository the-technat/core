# gh workspace variables
resource "tfe_variable" "gh_hcp_client_id" {
  key          = "hcp_client_id"
  category     = "terraform"
  value        = "true"
  workspace_id = data.tfe_workspace.gh.id
}

resource "tfe_variable" "gh_hcp_client_secret" {
  key          = "hcp_client_secret"
  value        = "true"
  category     = "terraform"
  workspace_id = data.tfe_workspace.gh.id
}