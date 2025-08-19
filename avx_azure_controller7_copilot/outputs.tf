output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "controller_public_ip_address" {
  value = azurerm_public_ip.ct_public_ip.ip_address
}

output "controller_network_interface_id" {
  value = azurerm_network_interface.ct_nic.id
}

output "controller_id" {
  value = azurerm_linux_virtual_machine.ct.id
}

output "copilot_public_ip_address" {
  value = azurerm_public_ip.cp_public_ip.ip_address
}

output "copilot_network_interface_id" {
  value = azurerm_network_interface.cp_nic.id
}

output "copilot_id" {
  value = azurerm_linux_virtual_machine.cp.id
}

