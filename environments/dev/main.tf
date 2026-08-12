module "RG" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rg
}
module "vnet" {
  depends_on = [module.RG]
  source     = "../../Modules/azurerm_virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.vnet, module.RG]
  source     = "../../Modules/azurerm_subnets"
  subnets    = var.subnets
}
module "pip" {
  depends_on = [module.RG]
  source     = "../../Modules/azurerm_pip"
  pip        = var.pip
}
module "nic" {
  depends_on = [module.pip, module.subnet]
  source     = "../../Modules/azurerm_nic"
  vms        = var.vms
}
module "VM_module" {
  depends_on = [module.nic]
  source     = "../../Modules/azurerm_virtual_machine"
  vms        = var.vms
}

module "nsg" {
  depends_on = [module.subnet]
  source     = "../../Modules/azurerm_nsg"
  vms        = var.vms
}

