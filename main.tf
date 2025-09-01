terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}



locals {
  selected_envs = { for k, v in var.environments : k => v if contains(var.environments_to_deploy, k) }
}

# Resource Groups
module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = local.selected_envs

  rg_name  = each.value.rg_name
  location = each.value.location
  tags     = merge(var.common_tags, each.value.tags)
}

# VNets
module "vnets" {
  source       = "./modules/vnet"
  for_each     = local.selected_envs

  vnet_name     = each.value.vnet_name
  location      = each.value.location
  rg_name       = module.resource_groups[each.key].rg_name
  address_space = each.value.vnet_cidr
  tags          = merge(var.common_tags, each.value.tags)
}

# Subnets
module "subnets" {
  source        = "./modules/subnet"
  for_each      = local.selected_envs

  subnet_name    = each.value.subnet_name
  rg_name        = module.resource_groups[each.key].rg_name
  vnet_name      = module.vnets[each.key].vnet_name
  address_prefix = each.value.subnet_cidr
  tags           = merge(var.common_tags, each.value.tags)
}

# VMs
module "vms" {
  source         = "./modules/virtual_machine"
  for_each       = local.selected_envs

  vm_name        = each.value.vm_name
  location       = each.value.location
  rg_name        = module.resource_groups[each.key].rg_name
  subnet_id      = module.subnets[each.key].subnet_id
  vm_size        = each.value.vm_size
  admin_username = "qwerty"
  tags           = merge(var.common_tags, each.value.tags)
}
