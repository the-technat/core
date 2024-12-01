resource "hcp_vault_secrets_app" "core" {
  app_name    = "core"
  description = "core secrets to be put into other core things"
  # core secrets are stored in there manually and can then be configured in other places
}

resource "hcp_vault_secrets_app" "wunschliste" {
  app_name    = "wunschliste"
  description = "Secrets related to the wunschliste project"
  project_id = hcp_project.wunschliste.resource_id
}
resource "hcp_vault_secrets_app_iam_binding" "wunschliste" {
  resource_name = hcp_vault_secrets_app.wunschliste.resource_name
  principal_id  = data.hcp_service_principal.core.resource_id
  role          = "roles/secrets.app-secret-manager"
}