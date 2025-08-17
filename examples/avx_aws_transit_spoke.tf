module "avx_aws_transit_spoke" {
  source = "github.com/sshussai/shaheer-tf//avx_aws_transit_spoke"

  transit_gw1_account_name             = "aws"
  transit_gw1_name                     = "prodtransit1"
  transit_gw1_vpc_id                   = module.prodtransit1.vpc_id
  transit_gw1_vpc_reg                  = "us-west-2"
  transit_gw1_subnet                   = "10.0.1.0/26"
  transit_gw1_gw_size                  = "c5n.xlarge"
  transit_gw1_ha_subnet                = "10.0.1.64/26"
  transit_gw1_ha_gw_size               = "c5n.xlarge"
  transit_gw1_local_as_number          = "65001"
  transit_gw1_enable_insane_mode       = true
  transit_gw1_insane_mode_az           = "us-west-2a"
  transit_gw1_ha_insane_mode_az        = "us-west-2a"
  transit_gw1_enable_hybrid_connection = false
  transit_gw1_connected_transit        = true

  transit_gw2_account_name             = "aws"
  transit_gw2_name                     = "prodtransit2"
  transit_gw2_vpc_id                   = module.prodtransit2.vpc_id
  transit_gw2_vpc_reg                  = "us-west-2"
  transit_gw2_subnet                   = "10.0.3.0/26"
  transit_gw2_gw_size                  = "c5n.xlarge"
  transit_gw2_ha_subnet                = "10.0.3.64/26"
  transit_gw2_ha_gw_size               = "c5n.xlarge"
  transit_gw2_local_as_number          = "65002"
  transit_gw2_enable_insane_mode       = true
  transit_gw2_insane_mode_az           = "us-west-2a"
  transit_gw2_ha_insane_mode_az        = "us-west-2a"
  transit_gw2_enable_hybrid_connection = false
  transit_gw2_connected_transit        = true

  spoke_gw1_account_name       = "aws"
  spoke_gw1_name               = "spoketransit1"
  spoke_gw1_vpc_id             = module.spoketransit1.vpc_id
  spoke_gw1_vpc_reg            = "us-west-2"
  spoke_gw1_subnet             = "10.0.5.0/26"
  spoke_gw1_gw_size            = "c5n.xlarge"
  spoke_gw1_single_ip_snat     = false
  spoke_gw1_enable_bgp         = true
  spoke_gw1_local_as_number    = "65003"
  spoke_gw1_enable_insane_mode = true
  spoke_gw1_insane_mode_az     = "us-west-2a"
  spoke_gw1_ha_insane_mode_az  = "us-west-2a"
  spoke_gw1_ha_subnet          = "10.0.4.0/26"

  spoke_gw2_account_name       = "aws"
  spoke_gw2_name               = "spoketransit2"
  spoke_gw2_vpc_id             = module.spoketransit2.vpc_id
  spoke_gw2_vpc_reg            = "us-west-2"
  spoke_gw2_subnet             = "10.0.7.0/26"
  spoke_gw2_gw_size            = "c5n.xlarge"
  spoke_gw2_single_ip_snat     = false
  spoke_gw2_enable_bgp         = true
  spoke_gw2_local_as_number    = "65004"
  spoke_gw2_enable_insane_mode = true
  spoke_gw2_insane_mode_az     = "us-west-2a"
  spoke_gw2_ha_insane_mode_az  = "us-west-2a"
  spoke_gw2_ha_subnet          = "10.0.6.0/26"

  peer_transit_gateways         = true
  attach_transit_spoke_gateways = true
}
