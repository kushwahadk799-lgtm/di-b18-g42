variable "vms" {}

resource "azurerm_network_security_group" "nsg_block" {
  for_each            = var.vms
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "Allow-inbound-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22", "80"] 
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "nsg_link" {
  for_each                  = var.vms
  depends_on                = [azurerm_network_security_group.nsg_block]
  subnet_id                 = data.azurerm_subnet.subnet_data[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg_block[each.key].id
}