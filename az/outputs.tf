output "sp_nuker_client_id" {
  value = azuread_service_principal.nuker.client_id 
  sensitive = true
}

output "sp_nuker_client_secret" {
  value = azuread_service_principal_password.nuker.value
  sensitive = true
}

output "tenant_id" {
  value = data.azurerm_subscription.current.tenant_id 
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id 
}