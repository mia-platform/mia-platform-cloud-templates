variable "storage_account_type" {
  description = "Storage Account Type"
  type = string
  default = "Premium_LRS"
}
variable "vm_size" {
  description = "The Virtual Machine Size"
  type = string
  default = "Standard_B1ms"
}
variable "image_offer" {
  description = "The VM Image offer"
  type = string
  default = "0001-com-ubuntu-server-jammy"
}
variable "image_publisher" {
  description = "The VM Image publisher"
  type = string
  default = "Canonical"
}
variable "image_sku" {
  description = "The VM Image SKU"
  type = string
  default = "22_04-lts-gen2"
}
variable "image_version" {
  description = "The VM Image version"
  type = string
  default = "latest"
}
