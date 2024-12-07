locals {
  aws_admin_policy_arn           = "arn:aws:iam::aws:policy/AdministratorAccess"
  github_issuer_url              = "https://token.actions.githubusercontent.com"
  default_audience_name          = "api://AzureADTokenExchange"
}

data "github_repositories" "all_repos" {
  query           = "org:the-technat"
  include_repo_id = true
}

data "github_repository" "core" {
  full_name = "the-technat/core"
}

data "aws_caller_identity" "current" {}


data "aws_iam_openid_connect_provider" "tfc" {
  url = "https://app.terraform.io"
}

data "azurerm_subscription" "current" {}

data "azuread_client_config" "current" {}

# https://solideogloria.tech/terraform/grant-admin-consent-for-an-azure-ad-application-with-terraform/
data "azuread_application_published_app_ids" "well_known" {}
data "azuread_service_principal" "msgraph" {
  client_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph
}
data "azuread_service_principals" "all" {
  return_all = true
}

data "hcp_service_principal" "core" {
  resource_name = "iam/organization/06a1a939-ba11-4b3b-97a5-f44ce781e88b/service-principal/core"
}