provider "azurerm" {
  features {}
}

# Virtual Network
resource "azurerm_virtual_network" "mycompany-poc-vnet" {
  name                = "mycompany-poc-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnet
resource "azurerm_subnet" "mycompany-poc-subnet" {
  name                 = "mycompany-poc-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.mycompany-poc-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [
    azurerm_virtual_network.mycompany-poc-vnet,
  ]
}

# Public IP
resource "azurerm_public_ip" "mycompany-poc-public-ip" {
  name                = "mycompany-poc-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Network Interface
resource "azurerm_network_interface" "mycompany-poc-nic" {
  name                = "mycompany-poc-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "mycompany-poc-ip-config"
    subnet_id                     = azurerm_subnet.mycompany-poc-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mycompany-poc-public-ip.id
  }

  depends_on = [
    azurerm_public_ip.mycompany-poc-public-ip,
    azurerm_subnet.mycompany-poc-subnet
  ]
}

# Network Security Group
resource "azurerm_network_security_group" "mycompany-poc-nsg" {
  location            = var.location
  name                = "mycompany-poc-nsg"
  resource_group_name = var.resource_group_name
}

# Network Security Group Association
resource "azurerm_network_interface_security_group_association" "mycompany-poc-nsg-association" {
  network_interface_id      = azurerm_network_interface.mycompany-poc-nic.id
  network_security_group_id = azurerm_network_security_group.mycompany-poc-nsg.id
  depends_on = [
    azurerm_network_interface.mycompany-poc-nic,
    azurerm_network_security_group.mycompany-poc-nsg
  ]
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "mycompany-poc-vm" {
  name                = "mycompany-poc-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.mycompany-poc-nic.id
  ]

  # Autenticazione con chiave SSH
  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa ****\n"
  }

  # Immagine della VM (Ubuntu 18.04)
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type

  }
}

# Output - Public IP Address
output "public_ip_address" {
  value = azurerm_public_ip.mycompany-poc-public-ip.ip_address
}