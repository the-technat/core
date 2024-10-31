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

