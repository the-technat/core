## account-nuker
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
resource "github_actions_secret" "account-nuker-azure-client-secret" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_CLIENT_SECRET"
  plaintext_value = azuread_service_principal_password.nuker.value
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
data "hcp_vault_secrets_secret" "devpod_hcloud_token" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "DEVPOD_HCLOUD_TOKEN"
}
resource "github_actions_secret" "account-nuker-hcloud-token-devpod" {
  repository      = github_repository.account-nuker.name
  secret_name     = "DEVPOD_HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.devpod_hcloud_token.secret_value
}


## tevbox
data "hcp_vault_secrets_secret" "tevbox_actions_hcloud_token" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "TEVBOX_ACTIONS_HCLOUD_TOKEN"
}
resource "github_actions_secret" "tevbox-hcloud-token-tevbox_actions" {
  repository      = github_repository.tevbox.name
  secret_name     = "HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_actions_hcloud_token.secret_value
}
data "hcp_vault_secrets_secret" "tevbox_hetzner_dns_token" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "TEVBOX_HETZNER_DNS_TOKEN"
}
resource "github_actions_secret" "tevbox-hetzner-dns-token" {
  repository      = github_repository.tevbox.name
  secret_name     = "HETZNER_DNS_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_actions_hcloud_token.secret_value
}
data "hcp_vault_secrets_secret" "tevbox_hcloud_s3_access_key" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "TEVBOX_HCLOUD_ACCESS_KEY"
}
data "hcp_vault_secrets_secret" "tevbox_hcloud_s3_secret_key" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "TEVBOX_HCLOUD_SECRET_KEY"
}
resource "github_actions_secret" "tevbox-hcloud-access-key" {
  repository      = github_repository.tevbox.name
  secret_name     = "HCLOUD_S3_ACCESS_KEY"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_hcloud_s3_access_key.secret_value
}
resource "github_actions_secret" "tevbox-hcloud-secret-key" {
  repository      = github_repository.tevbox.name
  secret_name     = "HCLOUD_S3_SECRET_KEY"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_hcloud_s3_secret_key.secret_value
}
data "hcp_vault_secrets_secret" "tevbox_ts_api_key" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "TEVBOX_TAILSCALE_API_KEY"
}
resource "github_actions_secret" "tevbox-ts_api_key" {
  repository      = github_repository.tevbox.name
  secret_name     = "TAILSCALE_API_KEY"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_ts_api_key.secret_value
}

## wunsch
data "hcp_vault_secrets_secret" "wish_fly_token" {
  app_name    = hcp_vault_secrets_app.core.app_name
  secret_name = "FLY_TOKEN_WISH"
}
resource "github_actions_secret" "wish-fly_token" {
  repository      = github_repository.wish.name
  secret_name     = "FLY_API_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.wish_fly_token.secret_value
}
