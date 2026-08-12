variable "rgs" {}

resource "azurerm_resource_group" "RG_Block" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}


# rgs = {
#   RG1 = {
#     name     = "RGCJ_1"
#     location = "central India"
#   }

#   RG2 = {
#     name     = "RGCJ_2"
#     location = "central India"
#   }
# }