output "tfc_secret_reader_client_id" {
  value     = hcp_service_principal_key.tfc_secret_reader.client_id
  sensitive = true
}

output "tfc_secret_reader_client_secret" {
  value     = hcp_service_principal_key.tfc_secret_reader.client_secret
  sensitive = true
}