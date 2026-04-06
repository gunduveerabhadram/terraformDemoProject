
terraform {
  required_version = ">=1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "8d4e463b-c3e4-4604-9d08-45ec5ab33ec8"

}
