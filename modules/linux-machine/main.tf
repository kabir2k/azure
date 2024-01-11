resource "azurerm_network_interface" "example" {
  name                = "vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id

  }
}


resource "azurerm_public_ip" "example" {
  name                = "example-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "terra-demo-machine"
  resource_group_name = var.resource_group_name
  location            =  var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
    
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("/home/user/Desktop/azure_pub_key")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}