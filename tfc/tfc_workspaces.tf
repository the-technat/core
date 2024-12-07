resource "tfe_workspace" "cappy" {
  name              = "cappy"
  organization      = data.tfe_organization.technat.name
  project_id        = tfe_project.cappy.id
  auto_apply        = true
  working_directory = "mgmt_cluster"
  terraform_version = "1.10.0"
  vcs_repo {
    identifier                 = "the-technat/cappy"
    github_app_installation_id = local.tfc_github_app_installation_id
  }
}

resource "tfe_variable" "tfc_aws_run_role_arn_cappy" {
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = data.tfe_outputs.aws.iam_role_cappy_arn
  category     = "env"
  workspace_id = tfe_workspace.cappy.id
}

resource "tfe_variable" "tfc_aws_provider_auth_cappy" {
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "env"
  workspace_id = tfe_workspace.cappy.id
}
