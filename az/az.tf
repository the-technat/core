terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "az"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
  use_cli         = false
  subscription_id = "559e87b7-6bd2-4c2a-a6f4-2c0e8b5b0edb" # the subscription "technat"
  tenant_id       = "afb1b04e-8a6f-44e6-8835-db3a1ab8bee7" # my microsoft account
}

provider "azuread" {
  use_cli   = false
  tenant_id = "afb1b04e-8a6f-44e6-8835-db3a1ab8bee7" # my microsoft account
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

locals {
  default_audience_name          = "api://AzureADTokenExchange"
}