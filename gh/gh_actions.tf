## account-nuker
resource "github_actions_secret" "account-nuker-aws-role" {
  repository      = github_repository.account-nuker.name
  secret_name     = "aws_role"
  plaintext_value = data.terraform_remote_state.aws.outputs.iam_role_nuker_arn
}
resource "github_actions_secret" "account-nuker-azure-client-id" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = data.terraform_remote_state.az.outputs.sp_nuker_client_id
}
resource "github_actions_secret" "account-nuker-azure-client-secret" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_CLIENT_SECRET"
  plaintext_value = data.terraform_remote_state.az.outputs.sp_nuker_client_secret
}
resource "github_actions_secret" "account-nuker-azure-tenant-id" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.terraform_remote_state.az.outputs.tenant_id
}
resource "github_actions_secret" "account-nuker-azure-subscription-id" {
  repository      = github_repository.account-nuker.name
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = data.terraform_remote_state.az.outputs.subscription_id
}

data "hcp_vault_secrets_secret" "tevbox_hcloud_token" {
  app_name    = "core"
  secret_name = "TEVBOX_HCLOUD_TOKEN"
}
resource "github_actions_secret" "account-nuker-hcloud-token-tevbox" {
  repository      = github_repository.account-nuker.name
  secret_name     = "TEVBOX_HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_hcloud_token.secret_value
}
data "hcp_vault_secrets_secret" "technat_dev_hcloud_token" {
  app_name    = "core"
  secret_name = "TECHNAT_DEV_HCLOUD_TOKEN"
}
resource "github_actions_secret" "account-nuker-hcloud-token-technat-dev" {
  repository      = github_repository.account-nuker.name
  secret_name     = "TECHNAT_DEV_HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.technat_dev_hcloud_token.secret_value
}


## tevbox
data "hcp_vault_secrets_secret" "tevbox_actions_hcloud_token" {
  app_name    = "core"
  secret_name = "TEVBOX_ACTIONS_HCLOUD_TOKEN"
}
resource "github_actions_secret" "tevbox-hcloud-token-tevbox_actions" {
  repository      = github_repository.tevbox.name
  secret_name     = "HCLOUD_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_actions_hcloud_token.secret_value
}
data "hcp_vault_secrets_secret" "tevbox_hetzner_dns_token" {
  app_name    = "core"
  secret_name = "TEVBOX_HETZNER_DNS_TOKEN"
}
resource "github_actions_secret" "tevbox-hetzner-dns-token" {
  repository      = github_repository.tevbox.name
  secret_name     = "HETZNER_DNS_TOKEN"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_hetzner_dns_token.secret_value
}
data "hcp_vault_secrets_secret" "tevbox_hcloud_s3_access_key" {
  app_name    = "core"
  secret_name = "TEVBOX_HCLOUD_ACCESS_KEY"
}
data "hcp_vault_secrets_secret" "tevbox_hcloud_s3_secret_key" {
  app_name    = "core"
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
  app_name    = "core"
  secret_name = "TEVBOX_TAILSCALE_API_KEY"
}
resource "github_actions_secret" "tevbox-ts_api_key" {
  repository      = github_repository.tevbox.name
  secret_name     = "TAILSCALE_API_KEY"
  plaintext_value = data.hcp_vault_secrets_secret.tevbox_ts_api_key.secret_value
}