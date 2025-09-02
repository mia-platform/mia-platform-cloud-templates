terraform {
  required_version = "~> 1.9.0"
  backend "azurerm" {
    storage_account_name = "mycompanypoc"
    container_name       = "mycompanycontainer"
    resource_group_name  = "mycompany"
    # key will be provided dynamically via -backend-config
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.5.0"
    }
  }
}
