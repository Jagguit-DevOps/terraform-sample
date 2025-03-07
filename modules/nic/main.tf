resource "azurerm_network_interface" "nic" {
  count               = length(var.nic_name)
  name                = var.nic_name[count.index]
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
