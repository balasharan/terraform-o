locals {
  common_tags = {
    Environment = "Sanbox"
    Owner       = "BSharanKumar"
    Project     = "TerraformAzureInfra"
  }

  # Environment from variable
  environments = var.environments

  # Common location
  location = "East US"

  # Tags based on environment
  tags = {
    dev = {
      environment = "Development"
      owner       = "Dev Team"
    }
    qa = {
      environment = "Quality Assurance"
      owner       = "QA Team"
    }
  }

  # Resource group names
  rg_names = {
    dev = "rg-dev"
    qa  = "rg-qa"
  }

  # VNET details
  vnets = {
    dev = {
      name          = "vnet-dev"
      address_space = ["10.0.0.0/16"]
    }
    qa = {
      name          = "vnet-qa"
      address_space = ["10.1.0.0/16"]
    }
  }

  # Subnet details
  subnets = {
    dev = {
      name           = "subnet-dev"
      address_prefix = "10.0.1.0/24"
    }
    qa = {
      name           = "subnet-qa"
      address_prefix = "10.1.1.0/24"
    }
  }

  # VM details
  vm_size = "Standard_B1s"

  vm_image = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_username = "qwerty"
}



