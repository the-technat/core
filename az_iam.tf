## account-nuker
resource "azuread_application" "nuker" {
  display_name = "nuker"
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
resource "time_rotating" "nuker" {
  rotation_days = 30
}
resource "azuread_service_principal_password" "nuker" {
  service_principal_id = azuread_service_principal.nuker.id
  rotate_when_changed = {
    rotation = time_rotating.nuker.id
  }
}