provider "azurerm" {
  features {}
}

# Storage Account
resource "azurerm_storage_account" "mycompany-poc-shared-storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = "StorageV2"
}

# File Share
resource "azurerm_storage_share" "mycompany-poc-file-share" {
  name                 = var.storage_share_name
  storage_account_name = azurerm_storage_account.mycompany-poc-shared-storage.name
  quota                = var.file_share_quota

  depends_on = [
    azurerm_storage_account.mycompany-poc-shared-storage
  ]
}

# Storage Account Access Key Data Source
data "azurerm_storage_account" "shared-storage-data" {
  name                = azurerm_storage_account.mycompany-poc-shared-storage.name
  resource_group_name = var.resource_group_name

  depends_on = [
    azurerm_storage_account.mycompany-poc-shared-storage
  ]
}

# Output - Storage Account Name
output "storage_account_name" {
  value = azurerm_storage_account.mycompany-poc-shared-storage.name
}

# Output - File Share Name
output "file_share_name" {
  value = azurerm_storage_share.mycompany-poc-file-share.name
}

# Output - Storage Account Primary Access Key
output "storage_account_primary_access_key" {
  value     = data.azurerm_storage_account.shared-storage-data.primary_access_key
  sensitive = true
}