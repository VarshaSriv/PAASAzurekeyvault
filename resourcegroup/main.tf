terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.70.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true 
  features {
  }
  subscription_id = var.az_subscriptionid
  tenant_id = var.az_tenantid
  client_id = "ecc5de6d-e40a-48f0-8e30-15774826d28c"
  client_secret = "Mrl8Q~YTsnTYnKbOaRKjoTPqME-YftvuNqiCYcMx"
}
