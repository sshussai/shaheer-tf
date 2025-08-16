# Aviatrix Transit & Spoke Gateway Terraform Module

This module provisions Aviatrix Transit Gateways, Spoke Gateways, HA Gateways, and Transit Gateway Peering in AWS using Terraform. It is designed for flexible, multi-gateway architectures and supports high availability and BGP configurations.

## Features
- Deploys two Aviatrix Transit Gateways with HA support
- Deploys two Aviatrix Spoke Gateways with optional HA
- Configures BGP and Insane Mode options
- Supports Transit Gateway Peering
- All resource attributes are exposed as outputs

## Usage
```
module "avx_aws_transit_spoke" {
  source = "./avx_aws_transit_spoke"
  # Set required variables here
  transit_gw1_name      = "transit-gw1"
  transit_gw1_vpc_id    = "vpc-xxxxxxx"
  # ...other variables...
}
```

## Inputs
See `variables.tf` for all configurable options and their descriptions.

## Outputs
See `outputs.tf` for all exported resource attributes.

## Requirements
- Terraform >= 1.0
- Aviatrix Terraform Provider