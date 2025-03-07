resource "azurerm_linux_virtual_machine" "vm" {
  count               = length(var.vm_name)
  name                = var.vm_name[count.index]
 #name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size               = "Standard_B2s"
  admin_username      = var.admin_username
  network_interface_ids = [var.nic_id[count.index]]

  admin_password = var.admin_password
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}
