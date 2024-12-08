# gh workspace variables
resource "tfe_variable" "gh_hcp_client_id" {
  key          = "hcp_client_id"
  category     = "terraform"
  value        = data.terraform_remote_state.hcp.outputs.tfc_secret_reader_client_id
  workspace_id = data.tfe_workspace.gh.id
}

resource "tfe_variable" "gh_hcp_client_secret" {
  key          = "hcp_client_secret"
  value        = data.terraform_remote_state.hcp.outputs.tfc_secret_reader_client_secret
  category     = "terraform"
  workspace_id = data.tfe_workspace.gh.id
}