resource "hcp_vault_secrets_app" "core" {
  app_name    = "core"
  description = "core secrets to be put into other core things"
  project_id    = data.hcp_project.core.resource_id
  # core secrets are stored in there manually and can then be configured in other places
}

resource "hcp_vault_secrets_app" "wunschliste" {
  app_name    = "wunschliste"
  description = "Secrets related to the wunschliste project"
  project_id = hcp_project.wunschliste.resource_id
}
