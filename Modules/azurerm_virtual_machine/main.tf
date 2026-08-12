variable "vms" {}

resource "azurerm_linux_virtual_machine" "VM_block" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = "Standard_D2ls_v5"
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  network_interface_ids           = [data.azurerm_network_interface.nic_data_block[each.key].id]
  disable_password_authentication = false


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}