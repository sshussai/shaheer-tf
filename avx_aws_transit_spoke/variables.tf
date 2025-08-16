### START - transit_gw1 vars

variable "transit_gw1_account_name" {
  description = "Cloud account name for the first Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw1_name" {
  description = "Name of the first Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw1_vpc_id" {
  description = "VPC ID for the first Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw1_vpc_reg" {
  description = "Region for the first Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw1_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "Subnet for the first Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw1_gw_size" {
  description = "Instance size for the first Aviatrix Transit Gateway"
  type        = string
  default     = "c5n.xlarge" # Default value can be adjusted as needed
}

variable "transit_gw1_ha_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "HA subnet for the first Aviatrix Transit Gateway"
  type        = string
  default     = ""
}

variable "transit_gw1_ha_gw_size" {
  description = "HA gateway size for the first Aviatrix Transit Gateway"
  type        = string
  default     = "c5n.xlarge"
}

variable "transit_gw1_local_as_number" {
  description = "Local AS number for the first Aviatrix Transit Gateway"
  type        = string
  default     = "65001"
}

variable "transit_gw1_enable_insane_mode" {
  description = "Enable Insane Mode for the first Aviatrix Transit Gateway"
  type        = bool
  default     = true
}

variable "transit_gw1_insane_mode_az" {
  description = "AZ for Insane Mode for the first Aviatrix Transit Gateway"
  type        = string
  default     = ""
}

variable "transit_gw1_ha_insane_mode_az" {
  description = "HA AZ for Insane Mode for the first Aviatrix Transit Gateway"
  type        = string
  default     = ""
}

variable "transit_gw1_enable_hybrid_connection" {
  description = "Enable hybrid connection for the first Aviatrix Transit Gateway"
  type        = bool
  default     = false
}

variable "transit_gw1_connected_transit" {
  description = "Connected transit flag for the first Aviatrix Transit Gateway"
  type        = bool
  default     = true
}

### END - transit_gw1 vars

### START - transit_gw2 vars

variable "transit_gw2_account_name" {
  description = "Cloud account name for the second Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw2_name" {
  description = "Name of the second Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw2_vpc_id" {
  description = "VPC ID for the second Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw2_vpc_reg" {
  description = "Region for the second Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw2_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "Subnet for the second Aviatrix Transit Gateway"
  type        = string
}

variable "transit_gw2_gw_size" {
  description = "Instance size for the second Aviatrix Transit Gateway"
  type        = string
  default     = "c5n.xlarge"
}

variable "transit_gw2_ha_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "HA subnet for the second Aviatrix Transit Gateway"
  type        = string
  default     = ""
}

variable "transit_gw2_ha_gw_size" {
  description = "HA gateway size for the second Aviatrix Transit Gateway"
  type        = string
  default     = "c5n.xlarge"
}

variable "transit_gw2_local_as_number" {
  description = "Local AS number for the second Aviatrix Transit Gateway"
  type        = string
  default     = "65002"
}

variable "transit_gw2_enable_insane_mode" {
  description = "Enable Insane Mode for the second Aviatrix Transit Gateway"
  type        = bool
  default     = true
}

variable "transit_gw2_insane_mode_az" {
  description = "AZ for Insane Mode for the second Aviatrix Transit Gateway"
  type        = string
  default     = ""
}

variable "transit_gw2_ha_insane_mode_az" {
  description = "HA AZ for Insane Mode for the second Aviatrix Transit Gateway"
  type        = string
  default     = ""
}

variable "transit_gw2_enable_hybrid_connection" {
  description = "Enable hybrid connection for the second Aviatrix Transit Gateway"
  type        = bool
  default     = false
}

variable "transit_gw2_connected_transit" {
  description = "Connected transit flag for the second Aviatrix Transit Gateway"
  type        = bool
  default     = true
}

### END - transit_gw2 vars

### START - spoke_gw1 vars

variable "spoke_gw1_account_name" {
  description = "Cloud account name for the first Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw1_name" {
  description = "Name of the first Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw1_vpc_id" {
  description = "VPC ID for the first Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw1_vpc_reg" {
  description = "Region for the first Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw1_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "Subnet for the first Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw1_gw_size" {
  description = "Instance size for the first Aviatrix Spoke Gateway"
  type        = string
  default     = "c5n.xlarge"
}

variable "spoke_gw1_single_ip_snat" {
  description = "Enable single IP SNAT for the first Aviatrix Spoke Gateway"
  type        = bool
  default     = false
}

variable "spoke_gw1_enable_bgp" {
  description = "Enable BGP for the first Aviatrix Spoke Gateway"
  type        = bool
  default     = true
}

variable "spoke_gw1_local_as_number" {
  description = "Local AS number for the first Aviatrix Spoke Gateway"
  type        = string
  default     = "65003"
}

variable "spoke_gw1_enable_insane_mode" {
  description = "Enable Insane Mode for the first Aviatrix Spoke Gateway"
  type        = bool
  default     = true
}

variable "spoke_gw1_insane_mode_az" {
  description = "AZ for Insane Mode for the first Aviatrix Spoke Gateway"
  type        = string
  default     = ""
}

variable "spoke_gw1_ha_insane_mode_az" {
  description = "HA AZ for Insane Mode for the first Aviatrix Spoke Gateway"
  type        = string
  default     = ""
}

variable "spoke_gw1_ha_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "HA subnet for the first Aviatrix Spoke Gateway"
  type        = string
  default     = ""
}

### END - spoke_gw1 vars

### START - spoke_gw2 vars

variable "spoke_gw2_account_name" {
  description = "Cloud account name for the second Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw2_name" {
  description = "Name of the second Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw2_vpc_id" {
  description = "VPC ID for the second Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw2_vpc_reg" {
  description = "Region for the second Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw2_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "Subnet for the second Aviatrix Spoke Gateway"
  type        = string
}

variable "spoke_gw2_gw_size" {
  description = "Instance size for the second Aviatrix Spoke Gateway"
  type        = string
  default     = "c5n.xlarge"
}

variable "spoke_gw2_single_ip_snat" {
  description = "Enable single IP SNAT for the second Aviatrix Spoke Gateway"
  type        = bool
  default     = false
}

variable "spoke_gw2_enable_bgp" {
  description = "Enable BGP for the second Aviatrix Spoke Gateway"
  type        = bool
  default     = true
}

variable "spoke_gw2_local_as_number" {
  description = "Local AS number for the second Aviatrix Spoke Gateway"
  type        = string
  default     = "65004"
}

variable "spoke_gw2_enable_insane_mode" {
  description = "Enable Insane Mode for the second Aviatrix Spoke Gateway"
  type        = bool
  default     = true
}

variable "spoke_gw2_insane_mode_az" {
  description = "AZ for Insane Mode for the second Aviatrix Spoke Gateway"
  type        = string
  default     = ""
}

variable "spoke_gw2_ha_insane_mode_az" {
  description = "HA AZ for Insane Mode for the second Aviatrix Spoke Gateway"
  type        = string
  default     = ""
}

variable "spoke_gw2_ha_subnet" {
  # for insane_mode, do not use existing subnet cidrs
  # for non-insane_mode, use existing subnet cidrs
  description = "HA subnet for the second Aviatrix Spoke Gateway"
  type        = string
  default     = ""
}

### END - spoke_gw1 vars

variable "peer_transit_gateways" {
  description = "Peer transit gateways"
  type        = bool
  default     = true
}

variable "attach_transit_spoke_gateways" {
  description = "Attach transit_gw1 to spoke_gw1 and transit_gw2 to spoke_gw2"
  type        = bool
  default     = true
}
