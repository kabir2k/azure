terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
} 

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  client_id = "8061c212-52d5-4966-8b6b-3bedad7e1508"
  client_secret = "f3y8Q~Z0-l5rrVPHRtAF3-vXCjHzTCtDXj1uWbah"
  tenant_id = "074238f8-fc59-4941-85cf-049324f09a95"
  subscription_id = "b027b5cc-6902-4eff-ba62-c823800c361d"
}


