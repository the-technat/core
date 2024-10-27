resource "hcp_vault_secrets_app" "core" {
  app_name    = "core"
  description = "core secrets to be put into other core things"
  # core secrets are stored in there manually and can then be configured in other places
}
