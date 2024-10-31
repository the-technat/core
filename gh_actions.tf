resource "github_actions_secret" "account-nuker-aws-role" {
  repository      = github_repository.account-nuker.name
  secret_name     = "aws_role"
  plaintext_value = aws_iam_role.nuker.arn
}

resource "github_actions_variable" "account-nuker-azure-client-id" {
  repository      = github_repository.account-nuker.name
  variable_name     = "AZURE_CLIENT_ID"
  value = azuread_service_principal.nuker.client_id
}
resource "github_actions_variable" "account-nuker-azure-tenant-id" {
  repository      = github_repository.account-nuker.name
  variable_name    = "AZURE_TENANT_ID"
  value = data.azurerm_subscription.current.tenant_id
}
resource "github_actions_variable" "account-nuker-azure-subscription-id" {
  repository      = github_repository.account-nuker.name
  variable_name     = "AZURE_SUBSCRIPTION_ID"
  value = data.azurerm_subscription.current.subscription_id
}
resource "github_actions_variable" "account-nuker-azure-use-oidc" {
  repository      = github_repository.account-nuker.name
  variable_name     = "ARM_USE_AZUREAD"
  value = "true"
}