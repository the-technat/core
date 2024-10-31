resource "github_actions_secret" "account-nuker-aws-role" {
  repository      = github_repository.account-nuker.name
  secret_name     = "aws_role"
  plaintext_value = aws_iam_role.nuker.arn
}
resource "github_actions_secret" "account-nuker-azure-client-id" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azuread_service_principal.nuker.client_id
}
resource "github_actions_secret" "account-nuker-azure-tenant-id" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.azurerm_subscription.current.tenant_id
}
resource "github_actions_secret" "account-nuker-azure-subscription-id" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = data.azurerm_subscription.current.subscription_id
}
data "hcp_vault_secrets_secret" "grapes_hcloud_token" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "GRAPES_HCLOUD_TOKEN"
}
resource "github_actions_secret" "account-nuker-hcloud-token-grapes" {
  repository      = github_repository.account-nuker.name
  secret_name     = "GRAPES_HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.grapes_hcloud_token.secret_value
}
data "hcp_vault_secrets_secret" "tevbox_hcloud_token" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "TEVBOX_HCLOUD_TOKEN"
}
resource "github_actions_secret" "account-nuker-hcloud-token-tevbox" {
  repository      = github_repository.account-nuker.name
  secret_name     = "TEVBOX_HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_hcloud_token.secret_value
}
data "hcp_vault_secrets_secret" "technat_dev_hcloud_token" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "TECHNAT_DEV_HCLOUD_TOKEN"
}
resource "github_actions_secret" "account-nuker-hcloud-token-technat-dev" {
  repository      = github_repository.account-nuker.name
  secret_name     = "TECHNAT_DEV_HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.technat_dev_hcloud_token.secret_value
}