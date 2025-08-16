output "transit_gw1_attributes" {
	description = "All attributes of aviatrix_transit_gateway.transit_gw1"
	value = {
		cloud_type                = aviatrix_transit_gateway.transit_gw1.cloud_type
		account_name              = aviatrix_transit_gateway.transit_gw1.account_name
		gw_name                   = aviatrix_transit_gateway.transit_gw1.gw_name
		vpc_id                    = aviatrix_transit_gateway.transit_gw1.vpc_id
		vpc_reg                   = aviatrix_transit_gateway.transit_gw1.vpc_reg
		gw_size                   = aviatrix_transit_gateway.transit_gw1.gw_size
		subnet                    = aviatrix_transit_gateway.transit_gw1.subnet
		ha_subnet                 = aviatrix_transit_gateway.transit_gw1.ha_subnet
		ha_gw_size                = aviatrix_transit_gateway.transit_gw1.ha_gw_size
		local_as_number           = aviatrix_transit_gateway.transit_gw1.local_as_number
		insane_mode               = aviatrix_transit_gateway.transit_gw1.insane_mode
		enable_hybrid_connection  = aviatrix_transit_gateway.transit_gw1.enable_hybrid_connection
		connected_transit         = aviatrix_transit_gateway.transit_gw1.connected_transit
		single_az_ha              = aviatrix_transit_gateway.transit_gw1.single_az_ha
		tags                      = aviatrix_transit_gateway.transit_gw1.tags
	}
}

output "transit_gw2_attributes" {
	description = "All attributes of aviatrix_transit_gateway.transit_gw2"
	value = {
		cloud_type                = aviatrix_transit_gateway.transit_gw2.cloud_type
		account_name              = aviatrix_transit_gateway.transit_gw2.account_name
		gw_name                   = aviatrix_transit_gateway.transit_gw2.gw_name
		vpc_id                    = aviatrix_transit_gateway.transit_gw2.vpc_id
		vpc_reg                   = aviatrix_transit_gateway.transit_gw2.vpc_reg
		gw_size                   = aviatrix_transit_gateway.transit_gw2.gw_size
		subnet                    = aviatrix_transit_gateway.transit_gw2.subnet
		ha_subnet                 = aviatrix_transit_gateway.transit_gw2.ha_subnet
		ha_gw_size                = aviatrix_transit_gateway.transit_gw2.ha_gw_size
		local_as_number           = aviatrix_transit_gateway.transit_gw2.local_as_number
		insane_mode               = aviatrix_transit_gateway.transit_gw2.insane_mode
		enable_hybrid_connection  = aviatrix_transit_gateway.transit_gw2.enable_hybrid_connection
		connected_transit         = aviatrix_transit_gateway.transit_gw2.connected_transit
		single_az_ha              = aviatrix_transit_gateway.transit_gw2.single_az_ha
		tags                      = aviatrix_transit_gateway.transit_gw2.tags
	}
}

output "spoke_gw1_attributes" {
	description = "All attributes of aviatrix_spoke_gateway.spoke_gw1"
	value = {
		cloud_type        = aviatrix_spoke_gateway.spoke_gw1.cloud_type
		account_name      = aviatrix_spoke_gateway.spoke_gw1.account_name
		gw_name           = aviatrix_spoke_gateway.spoke_gw1.gw_name
		vpc_id            = aviatrix_spoke_gateway.spoke_gw1.vpc_id
		vpc_reg           = aviatrix_spoke_gateway.spoke_gw1.vpc_reg
		gw_size           = aviatrix_spoke_gateway.spoke_gw1.gw_size
		subnet            = aviatrix_spoke_gateway.spoke_gw1.subnet
		insane_mode       = aviatrix_spoke_gateway.spoke_gw1.insane_mode
		single_ip_snat    = aviatrix_spoke_gateway.spoke_gw1.single_ip_snat
		enable_bgp        = aviatrix_spoke_gateway.spoke_gw1.enable_bgp
		local_as_number   = aviatrix_spoke_gateway.spoke_gw1.local_as_number
		manage_ha_gateway = aviatrix_spoke_gateway.spoke_gw1.manage_ha_gateway
		single_az_ha      = aviatrix_spoke_gateway.spoke_gw1.single_az_ha
		tags              = aviatrix_spoke_gateway.spoke_gw1.tags
	}
}

output "spoke_gw2_attributes" {
	description = "All attributes of aviatrix_spoke_gateway.spoke_gw2"
	value = {
		cloud_type        = aviatrix_spoke_gateway.spoke_gw2.cloud_type
		account_name      = aviatrix_spoke_gateway.spoke_gw2.account_name
		gw_name           = aviatrix_spoke_gateway.spoke_gw2.gw_name
		vpc_id            = aviatrix_spoke_gateway.spoke_gw2.vpc_id
		vpc_reg           = aviatrix_spoke_gateway.spoke_gw2.vpc_reg
		gw_size           = aviatrix_spoke_gateway.spoke_gw2.gw_size
		subnet            = aviatrix_spoke_gateway.spoke_gw2.subnet
		insane_mode       = aviatrix_spoke_gateway.spoke_gw2.insane_mode
		single_ip_snat    = aviatrix_spoke_gateway.spoke_gw2.single_ip_snat
		enable_bgp        = aviatrix_spoke_gateway.spoke_gw2.enable_bgp
		local_as_number   = aviatrix_spoke_gateway.spoke_gw2.local_as_number
		manage_ha_gateway = aviatrix_spoke_gateway.spoke_gw2.manage_ha_gateway
		single_az_ha      = aviatrix_spoke_gateway.spoke_gw2.single_az_ha
		tags              = aviatrix_spoke_gateway.spoke_gw2.tags
	}
}

output "spoke_gw1_ha_attributes" {
	description = "All attributes of aviatrix_spoke_ha_gateway.spoke_gw1_ha"
	value = var.spoke_gw1_ha_subnet == "" ? {} : {
		primary_gw_name = aviatrix_spoke_ha_gateway.spoke_gw1_ha[0].primary_gw_name
		subnet          = aviatrix_spoke_ha_gateway.spoke_gw1_ha[0].subnet
	}
}

output "spoke_gw2_ha_attributes" {
	description = "All attributes of aviatrix_spoke_ha_gateway.spoke_gw2_ha"
	value = var.spoke_gw2_ha_subnet == "" ? {} : {
		primary_gw_name = aviatrix_spoke_ha_gateway.spoke_gw2_ha[0].primary_gw_name
		subnet          = aviatrix_spoke_ha_gateway.spoke_gw2_ha[0].subnet
	}
}

output "transit_gateway_peering_attributes" {
	description = "All attributes of aviatrix_transit_gateway_peering.transit_gateway_peering"
	value = var.peer_transit_gateways ? {
		transit_gateway_name1 = aviatrix_transit_gateway_peering.transit_gateway_peering.transit_gateway_name1
		transit_gateway_name2 = aviatrix_transit_gateway_peering.transit_gateway_peering.transit_gateway_name2
	} : {}
}
