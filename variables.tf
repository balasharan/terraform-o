variable "environments_to_deploy" {
  description = "List of environments to deploy"
  type        = list(string)
}

variable "environments" {
  description = "Map of environment configurations"
  type = map(object({
    location     = string
    rg_name      = string
    vnet_name    = string
    vnet_cidr    = string
    subnet_name  = string
    subnet_cidr  = string
    vm_name      = string
    vm_size      = string
    tags         = map(string)
  }))
  default = {
    dev = {
      location     = "eastus"
      rg_name      = "rg-dev"
      vnet_name    = "vnet-dev"
      vnet_cidr    = "10.0.0.0/16"
      subnet_name  = "subnet-dev"
      subnet_cidr  = "10.0.1.0/24"
      vm_name      = "vm-dev"
      vm_size      = "Standard_B1s"
      tags         = { env = "dev" }
    }
    qa = {
      location     = "eastus2"
      rg_name      = "rg-qa"
      vnet_name    = "vnet-qa"
      vnet_cidr    = "10.1.0.0/16"
      subnet_name  = "subnet-qa"
      subnet_cidr  = "10.1.1.0/24"
      vm_name      = "vm-qa"
      vm_size      = "Standard_B1s"
      tags         = { env = "qa" }
    }
  }
}

variable "common_tags" {
  type = map(string)
  default = {
    owner  = "Team-Bala"
    source = "terraform"
  }
}
