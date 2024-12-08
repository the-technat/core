# SP for tfc workspace
resource "hcp_service_principal" "tfc_secret_reader" {
  name = "tfc-secret-reader"
}
# Note this requires the Terraform to be run regularly
resource "time_rotating" "key_rotation" {
  rotation_days = 14
}
resource "hcp_service_principal_key" "tfc_secret_reader" {
  service_principal = hcp_service_principal.tfc_secret_reader.resource_name
  rotate_triggers {
    rotation_time = time_rotating.key_rotation.rotation_rfc3339
  }
}
# grants the SP access to the core project
resource "hcp_project_iam_binding" "tfc_secret_reader" {
  principal_id = hcp_service_principal.tfc_secret_reader.resource_id
  role         = "roles/secrets.app-secret-reader"
}