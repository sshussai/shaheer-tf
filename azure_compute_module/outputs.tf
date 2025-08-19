output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "ip_configuration" {
  value = azurerm_network_interface.nic.ip_configuration
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "network_interface_id" {
  value = azurerm_network_interface.nic.id
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

