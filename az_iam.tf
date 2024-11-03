## account-nuker
resource "azuread_application" "nuker" {
  display_name = "nuker"
  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      id   = data.azuread_service_principal.msgraph.app_role_ids["Application.ReadWrite.All"]
      type = "Role"
    }
    resource_access {
      id   = data.azuread_service_principal.msgraph.app_role_ids["Group.ReadWrite.All"]
      type = "Role"
    }
    resource_access {
      id   = data.azuread_service_principal.msgraph.app_role_ids["User.Read.All"]
      type = "Role"
    }
  }
  tags = [
    "managed-by\":\"terraform\""
  ]
}
resource "azurerm_role_assignment" "nuker" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.nuker.object_id
}
# https://solideogloria.tech/terraform/grant-admin-consent-for-an-azure-ad-application-with-terraform/
# Because both required_resource_access and resource_access are blocks, they are internally
# represented as lists of obejcts. Therefore, we need to build a new list which flattens
# these nested representations into a single list of objects.
# To make life difficult, we need the object_id and not the client_id of the service principal :(
resource "azuread_app_role_assignment" "nuker" {
  for_each = { for v in flatten([
    for rra in azuread_application.nuker.required_resource_access : [
      for ra in rra.resource_access : {
        resource_object_id = one([
          # Loop through all the service principals and find the object_id of the one
          # that matches the client_id of the resource_app_id from the azuread_application.
          for sp in data.azuread_service_principals.all.service_principals :
          sp.object_id
          if sp.client_id == rra.resource_app_id
        ])
        app_role_id = ra.id
      }
    ]
  ]) : join("|", [v.resource_object_id, v.app_role_id]) => v }

  principal_object_id = azuread_service_principal.nuker.object_id
  resource_object_id  = each.value.resource_object_id
  app_role_id         = each.value.app_role_id
}
resource "azuread_service_principal" "nuker" {
  client_id = azuread_application.nuker.client_id
  owners    = [data.azuread_client_config.current.object_id]
  tags = [
    "managed-by\":\"terraform\""
  ]
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