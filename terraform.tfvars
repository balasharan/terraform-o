environments = {
  dev = {
    location      = "eastus"
    rg_name       = "rg-dev"
    vnet_name     = "vnet-dev"
    address_space = "10.0.0.0/16"
    subnet_name   = "subnet-dev"
    subnet_prefix = "10.0.1.0/24"
    vm_name       = "vm-dev"
    vm_size       = "Standard_B1s"
    vm_count      = 1
    vnet_cidr     = "10.0.0.0/16"
    subnet_cidr   = "10.0.1.0/24"
    tags = {
      EnvOwner = "DevTeam"
    }
  }

  qa = {
    location      = "eastus2"
    rg_name       = "rg-qa"
    vnet_name     = "vnet-qa"
    address_space = "10.1.0.0/16"
    subnet_name   = "subnet-qa"
    subnet_prefix = "10.1.1.0/24"
    vm_name       = "vm-qa"
    vm_size       = "Standard_B1s"
    vm_count      = 1
    vnet_cidr     = "10.0.0.0/16"
    subnet_cidr   = "10.0.1.0/24"
    tags = {
      EnvOwner = "QATeam"
    }
  }
}

common_tags = {
  Project = "DevOps"
  Owner   = "ITOps"
}

