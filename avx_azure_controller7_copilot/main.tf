resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  count               = var.subnet_id == "" ? 1 : 0
  name                = "${var.name_prefix}-vnet"
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  count                = var.subnet_id == "" ? 1 : 0
  name                 = "${var.name_prefix}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_public_ip" "ct_public_ip" {
  name                = "${var.name_prefix}-ct-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "cp_public_ip" {
  name                = "${var.name_prefix}-cp-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

locals {
  subnet_id = var.subnet_id == "" ? azurerm_subnet.subnet[0].id : var.subnet_id
}

resource "azurerm_network_interface" "ct_nic" {
  name                = "${var.name_prefix}-ct-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ct_public_ip.id
  }
}

resource "azurerm_network_interface" "cp_nic" {
  name                = "${var.name_prefix}-cp-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cp_public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "ct" {
  name                            = "${var.name_prefix}-ct"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.ct_nic.id,
  ]
  # admin_ssh_key {
  #   username   = var.admin_username
  #   public_key = var.admin_ssh_public_key
  # }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "aviatrix-controller-g3"
    publisher = "aviatrix-systems"
    product   = "aviatrix-controller"
  }

  source_image_reference {
    publisher = "aviatrix-systems"
    offer     = "aviatrix-controller"
    sku       = "aviatrix-controller-g3"
    version   = "20240923.1605.0"
  }
}

resource "azurerm_linux_virtual_machine" "cp" {
  name                            = "${var.name_prefix}-cp"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.cp_nic.id,
  ]
  # admin_ssh_key {
  #   username   = var.admin_username
  #   public_key = var.admin_ssh_public_key
  # }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "avx-cplt-byol-02"
    publisher = "aviatrix-systems"
    product   = "aviatrix-copilot"
  }

  source_image_reference {
    publisher = "aviatrix-systems"
    offer     = "aviatrix-copilot"
    sku       = "avx-cplt-byol-02"
    version   = "4.12.0"
  }
}

resource "azurerm_network_security_group" "cp_nsg" {
  name                = "${var.name_prefix}-cp-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "cp_https_rule" {
  name                        = "Allow-HTTPS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.cp_nsg.name
}

resource "azurerm_network_security_rule" "netflow_rule" {
  name                        = "Allow-Netflow"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "31283"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.cp_nsg.name
}

resource "azurerm_network_security_rule" "syslog_rule" {
  name                        = "Allow-Syslog"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "5000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.cp_nsg.name
}

resource "azurerm_network_interface_security_group_association" "cp_nic_nsg" {
  network_interface_id      = azurerm_network_interface.cp_nic.id
  network_security_group_id = azurerm_network_security_group.cp_nsg.id
}

resource "azurerm_network_security_group" "ct_nsg" {
  name                = "${var.name_prefix}-ct-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "ct_https_rule" {
  name                        = "Allow-HTTPS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.ct_nsg.name
}

resource "azurerm_network_interface_security_group_association" "ct_nic_nsg" {
  network_interface_id      = azurerm_network_interface.ct_nic.id
  network_security_group_id = azurerm_network_security_group.ct_nsg.id
}

