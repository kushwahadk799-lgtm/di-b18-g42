rg = {
  RG1 = {
    name     = "RGCJ_1"
    location = "central India"
  }

  RG2 = {
    name     = "RGCJ_2"
    location = "central India"
  }
}

vnets = {
  vnet1 = {
    name                = "vnetCJ1"
    location            = "central India"
    resource_group_name = "RGCJ_1"
    address_space       = ["10.100.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet-cj"
    resource_group_name  = "RGCJ_1"
    virtual_network_name = "vnetCJ1"
    address_prefixes     = ["10.100.1.0/24"]
  }

  subnet2 = {
    name                 = "backend-subnet-cj"
    resource_group_name  = "RGCJ_1"
    virtual_network_name = "vnetCJ1"
    address_prefixes     = ["10.100.2.0/24"]
  }

}

pip = {
  pip1 = {
    name                = "VMCJ1_pip"
    resource_group_name = "RGCJ_1"
    location            = "Central India"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "VMCJ2_pip"
    resource_group_name = "RGCJ_1"
    location            = "Central India"
    allocation_method   = "Static"
  }
}

vms = {
  vm1 = {
    nic_name             = "VM1-NIC"
    location             = "central India"
    resource_group_name  = "RGCJ_1"
    virtual_network_name = "vnetCJ1"
    subnet_name          = "frontend-subnet-cj"
    public_ip_name       = "VMCJ1_pip"
    vm_name              = "VMCJ1"
    admin_username       = "shekhar_admin1"
    admin_password       = "shekhar_admin1@123"
    nsg_name            = "NSG-SSH-CJ1"
  }

  vm2 = {
    nic_name             = "VM2-NIC"
    location             = "central India"
    resource_group_name  = "RGCJ_1"
    virtual_network_name = "vnetCJ1"
    subnet_name          = "backend-subnet-cj"
    public_ip_name       = "VMCJ2_pip"
    vm_name              = "VMCJ2"
    admin_username       = "shekhar_admin2"
    admin_password       = "shekhar_admin2@123"
nsg_name            = "NSG-SSH-CJ2"
  }
}


