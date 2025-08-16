# Create an Aviatrix AWS Transit Network Gateway
resource "aviatrix_transit_gateway" "transit_gw1" {
  cloud_type        = 1
  account_name      = var.transit_gw1_account_name
  gw_name           = var.transit_gw1_name
  vpc_id            = var.transit_gw1_vpc_id
  vpc_reg           = var.transit_gw1_vpc_reg
  gw_size           = var.transit_gw1_gw_size
  subnet            = var.transit_gw1_subnet
  ha_subnet         = var.transit_gw1_ha_subnet
  ha_gw_size        = var.transit_gw1_ha_gw_size
  local_as_number   = var.transit_gw1_local_as_number
  insane_mode       = var.transit_gw1_enable_insane_mode
  insane_mode_az    = var.transit_gw1_insane_mode_az
  ha_insane_mode_az = var.transit_gw1_ha_insane_mode_az
  tags = {
    name = var.transit_gw1_name
  }
  enable_hybrid_connection = var.transit_gw1_enable_hybrid_connection
  connected_transit        = var.transit_gw1_connected_transit
  single_az_ha             = true
}

# Create an Aviatrix AWS Transit Network Gateway
resource "aviatrix_transit_gateway" "transit_gw2" {
  cloud_type        = 1
  account_name      = var.transit_gw2_account_name
  gw_name           = var.transit_gw2_name
  vpc_id            = var.transit_gw2_vpc_id
  vpc_reg           = var.transit_gw2_vpc_reg
  gw_size           = var.transit_gw2_gw_size
  subnet            = var.transit_gw2_subnet
  ha_subnet         = var.transit_gw2_ha_subnet
  ha_gw_size        = var.transit_gw2_ha_gw_size
  local_as_number   = var.transit_gw2_local_as_number
  insane_mode       = var.transit_gw2_enable_insane_mode
  insane_mode_az    = var.transit_gw2_insane_mode_az
  ha_insane_mode_az = var.transit_gw2_ha_insane_mode_az
  tags = {
    name = var.transit_gw2_name
  }
  enable_hybrid_connection = var.transit_gw2_enable_hybrid_connection
  connected_transit        = var.transit_gw2_connected_transit
  single_az_ha             = true
}

# Create an Aviatrix AWS Spoke Gateway with BGP enabled
resource "aviatrix_spoke_gateway" "spoke_gw1" {
  cloud_type        = 1
  account_name      = var.spoke_gw1_account_name
  gw_name           = var.spoke_gw1_name
  vpc_id            = var.spoke_gw1_vpc_id
  vpc_reg           = var.spoke_gw1_vpc_reg
  gw_size           = var.spoke_gw1_gw_size
  subnet            = var.spoke_gw1_subnet
  insane_mode       = var.spoke_gw1_enable_insane_mode
  insane_mode_az    = var.spoke_gw1_insane_mode_az
  single_ip_snat    = var.spoke_gw1_single_ip_snat
  enable_bgp        = true
  local_as_number   = var.spoke_gw1_local_as_number
  manage_ha_gateway = false
  single_az_ha      = true
  tags = {
    name = var.spoke_gw1_name
  }
}

# Create an Aviatrix AWS Spoke HA Gateway
resource "aviatrix_spoke_ha_gateway" "spoke_gw1_ha" {
  depends_on      = [aviatrix_spoke_gateway.spoke_gw1]
  count           = var.spoke_gw1_ha_subnet == "" ? 0 : 1
  primary_gw_name = var.spoke_gw1_name
  subnet          = var.spoke_gw1_ha_subnet
  insane_mode_az  = var.spoke_gw1_ha_insane_mode_az
}

resource "aviatrix_spoke_gateway" "spoke_gw2" {
  cloud_type        = 1
  account_name      = var.spoke_gw2_account_name
  gw_name           = var.spoke_gw2_name
  vpc_id            = var.spoke_gw2_vpc_id
  vpc_reg           = var.spoke_gw2_vpc_reg
  gw_size           = var.spoke_gw2_gw_size
  subnet            = var.spoke_gw2_subnet
  insane_mode       = var.spoke_gw2_enable_insane_mode
  insane_mode_az    = var.spoke_gw2_insane_mode_az
  single_ip_snat    = var.spoke_gw2_single_ip_snat
  enable_bgp        = true
  local_as_number   = var.spoke_gw2_local_as_number
  manage_ha_gateway = false
  single_az_ha      = true
  tags = {
    name = var.spoke_gw2_name
  }
}

resource "aviatrix_spoke_ha_gateway" "spoke_gw2_ha" {
  depends_on      = [aviatrix_spoke_gateway.spoke_gw2]
  count           = var.spoke_gw2_ha_subnet == "" ? 0 : 1
  primary_gw_name = var.spoke_gw2_name
  subnet          = var.spoke_gw2_ha_subnet
  insane_mode_az  = var.spoke_gw2_ha_insane_mode_az
}

# Create an Aviatrix Transit Gateway Peering
resource "aviatrix_transit_gateway_peering" "transit_gateway_peering" {
  count                 = var.peer_transit_gateways ? 1 : 0
  transit_gateway_name1 = aviatrix_transit_gateway.transit_gw1.gw_name
  transit_gateway_name2 = aviatrix_transit_gateway.transit_gw2.gw_name
}

# Create an Aviatrix Spoke Transit Attachment
resource "aviatrix_spoke_transit_attachment" "attachment1" {
  count           = var.attach_transit_spoke_gateways ? 1 : 0
  spoke_gw_name   = aviatrix_spoke_gateway.spoke_gw1.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit_gw1.gw_name
}

resource "aviatrix_spoke_transit_attachment" "attachment2" {
  count           = var.attach_transit_spoke_gateways ? 1 : 0
  spoke_gw_name   = aviatrix_spoke_gateway.spoke_gw2.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit_gw2.gw_name
}
