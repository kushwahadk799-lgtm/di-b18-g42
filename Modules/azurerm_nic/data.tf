data "azurerm_subnet" "subnet_data" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}


data "azurerm_public_ip" "pip_data" {
  for_each            = var.vms
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}