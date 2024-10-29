resource "azuread_application" "nuker" {
  display_name     = "nuker"
  web {}
}