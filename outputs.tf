output "resource_group_names" {
  value = { for k, v in module.resource_groups : k => v.rg_name }
}

output "vnet_names" {
  value = { for k, v in module.vnets : k => v.vnet_name }
}

output "subnet_ids" {
  value = { for k, v in module.subnets : k => v.subnet_id }
}

output "vm_public_ips" {
  value = { for k, v in module.vms : k => v.public_ip }
}
