variable "name_prefix" {
  description = "Prefix for all resource names"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = string
  default     = "10.0.0.0/23"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = string
  default     = "10.0.0.0/26"
}

variable "subnet_id" {
  description = "If using existing VNet and subnet, provide subnet ID"
  type        = string
  default     = ""
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

# variable "admin_ssh_public_key" {
#   description = "SSH public key for the VM"
#   type        = string
# }

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  default     = "Aviatrix123!@"
}

