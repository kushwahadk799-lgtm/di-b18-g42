variable "vms" {}

resource "azurerm_network_interface" "nic_block" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id #required
    public_ip_address_id          = data.azurerm_public_ip.pip_data[each.key].id #Optional
    private_ip_address_allocation = "Dynamic" # NIC's private IP address
  }
}
  