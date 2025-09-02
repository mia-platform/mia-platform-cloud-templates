terraform {
  required_version = "~> 1.9.0"
  backend "azurerm" {
    storage_account_name = "mycompanypoc"
    container_name       = "mycompanycontainer"
    key                  = "mycompany-poc-terraform-project.tfstate"
    resource_group_name  = "mycompany"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.5.0"
    }
  }
}
