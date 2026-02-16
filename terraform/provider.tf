########################################################
# TERRAFORM & PROVIDER
########################################################

terraform {
  required_version = ">=1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.100"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-states-mdsr"
    storage_account_name = "saterraformstatesmdsr"
    container_name       = "terraformstatescontainer"
    key                  = "uinsure.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

########################################################
# AZURE CLIENT CONFIG
# Used to get subscription/tenant info
########################################################

data "azurerm_client_config" "current" {}
