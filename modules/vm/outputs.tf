// output "vm_name" {
//   value = azurerm_linux_virtual_machine.vm.name
// }
// output "vm_id" {
//   value = azurerm_linux_virtual_machine.vm.id
// }


output "vm_names" {
  description = "List of VM names"
  value       = azurerm_linux_virtual_machine.vm[*].name
}

output "vm_ids" {
  description = "List of VM IDs"
  value       = azurerm_linux_virtual_machine.vm[*].id
}
