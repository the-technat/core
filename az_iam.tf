resource "azuread_application" "nuker" {
  display_name = "nuker"
  web {}
}

resource "azurerm_role_assignment" "nuker" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.nuker.object_id
}

resource "azuread_service_principal" "nuker" {
  client_id = azuread_application.nuker.client_id
  owners    = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_federated_identity_credential" "nuker-main" {
  application_id = azuread_application.nuker.id
  display_name   = "account-nuker-github-actions-main"
  audiences      = [local.default_audience_name]
  issuer         = local.github_issuer_url
  subject        = "repo:the-technat/account-nuker:ref:refs/heads/main"
}

resource "azuread_application_federated_identity_credential" "nuker-pr" {
  application_id = azuread_application.nuker.id
  display_name   = "account-nuker-github-actions-pr"
  audiences      = [local.default_audience_name]
  issuer         = local.github_issuer_url
  subject        = "repo:the-technat/account-nuker:pull_request"
}