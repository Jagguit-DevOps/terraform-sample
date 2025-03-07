output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = module.rg.rg_name
}

output "resource_group_location" {
  description = "Location of the Resource Group"
  value       = module.rg.location
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = module.vnet.vnet_name
}

output "subnet_name" {
  description = "Name of the Subnet"
  value       = module.subnet.subnet_name
}

output "subnet_id" {
  value = module.subnet.subnet_id
}
output "nic_id" {
  value = module.nic.nic_ids
}

// output "storage_account_name" {
//   description = "Name of the Storage Account"
//   value       = module.storage.storage_name
// }

// output "aks_cluster_id" {
//   description = "The ID of the AKS cluster"
//   value       = module.aks.aks_id
// }

output "vm_ids" {
  description = "The ID of the Virtual Machine"
  value       = module.vm.vm_ids
}

output "admin_username" {
  description = "Admin username for the VM"
  value       = var.admin_username
}
