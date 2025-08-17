module "prodtransit1" {
  source = "github.com/sshussai/shaheer-tf//aws_networking_module"

  region               = "us-west-2"
  name_prefix          = "prodtransit1"
  vpc_cidr             = "10.0.0.0/23"
  public_subnet_cidrs  = ["10.0.0.0/26", "10.0.0.64/26", "10.0.0.128/26"]
  private_subnet_cidrs = ["10.0.0.192/26"]
}

output "prodtransit1_vpc_id" {
  description = "The ID of the VPC"
  value       = module.prodtransit1.vpc_id
}

output "prodtransit1_public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.prodtransit1.public_subnet_ids
}

output "prodtransit1_private_subnet_id" {
  description = "The IDs of the private subnets"
  value       = module.prodtransit1.private_subnet_ids
}

output "prodtransit1_public_subnet_cidrs" {
  description = "The CIDRs of the public subnets"
  value       = module.prodtransit1.public_subnet_cidrs
}

output "prodtransit1_private_subnet_cidrs" {
  description = "The CIDRs of the private subnets"
  value       = module.prodtransit1.private_subnet_cidrs
}

output "prodtransit1_internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.prodtransit1.internet_gateway_id
}

output "prodtransit1_nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.prodtransit1.nat_gateway_id
}

module "prodtransit2" {
  source = "github.com/sshussai/shaheer-tf//aws_networking_module"

  region               = "us-west-2"
  name_prefix          = "prodtransit2"
  vpc_cidr             = "10.0.2.0/23"
  public_subnet_cidrs  = ["10.0.2.0/26", "10.0.2.64/26", "10.0.2.128/26"]
  private_subnet_cidrs = ["10.0.2.192/26"]
}

output "prodtransit2_vpc_id" {
  description = "The ID of the VPC"
  value       = module.prodtransit2.vpc_id
}

output "prodtransit2_public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.prodtransit2.public_subnet_ids
}

output "prodtransit2_private_subnet_id" {
  description = "The IDs of the private subnets"
  value       = module.prodtransit2.private_subnet_ids
}

output "prodtransit2_public_subnet_cidrs" {
  description = "The CIDRs of the public subnets"
  value       = module.prodtransit2.public_subnet_cidrs
}

output "prodtransit2_private_subnet_cidrs" {
  description = "The CIDRs of the private subnets"
  value       = module.prodtransit2.private_subnet_cidrs
}

output "prodtransit2_internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.prodtransit2.internet_gateway_id
}

output "prodtransit2_nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.prodtransit2.nat_gateway_id
}

module "spoketransit1" {
  source = "github.com/sshussai/shaheer-tf//aws_networking_module"

  region               = "us-west-2"
  name_prefix          = "spoketransit1"
  vpc_cidr             = "10.0.4.0/23"
  public_subnet_cidrs  = ["10.0.4.0/26", "10.0.4.64/26", "10.0.4.128/26"]
  private_subnet_cidrs = ["10.0.4.192/26"]
}

output "spoketransit1_vpc_id" {
  description = "The ID of the VPC"
  value       = module.spoketransit1.vpc_id
}

output "spoketransit1_public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.spoketransit1.public_subnet_ids
}

output "spoketransit1_private_subnet_id" {
  description = "The IDs of the private subnets"
  value       = module.spoketransit1.private_subnet_ids
}

output "spoketransit1_public_subnet_cidrs" {
  description = "The CIDRs of the public subnets"
  value       = module.spoketransit1.public_subnet_cidrs
}

output "spoketransit1_private_subnet_cidrs" {
  description = "The CIDRs of the private subnets"
  value       = module.spoketransit1.private_subnet_cidrs
}

output "spoketransit1_internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.spoketransit1.internet_gateway_id
}

output "spoketransit1_nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.spoketransit1.nat_gateway_id
}

module "spoketransit2" {
  source = "github.com/sshussai/shaheer-tf//aws_networking_module"

  region               = "us-west-2"
  name_prefix          = "spoketransit2"
  vpc_cidr             = "10.0.6.0/23"
  public_subnet_cidrs  = ["10.0.6.0/26", "10.0.6.64/26", "10.0.6.128/26"]
  private_subnet_cidrs = ["10.0.6.192/26"]
}

output "spoketransit2_vpc_id" {
  description = "The ID of the VPC"
  value       = module.spoketransit2.vpc_id
}

output "spoketransit2_public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.spoketransit2.public_subnet_ids
}

output "spoketransit2_private_subnet_id" {
  description = "The IDs of the private subnets"
  value       = module.spoketransit2.private_subnet_ids
}

output "spoketransit2_public_subnet_cidrs" {
  description = "The CIDRs of the public subnets"
  value       = module.spoketransit2.public_subnet_cidrs
}

output "spoketransit2_private_subnet_cidrs" {
  description = "The CIDRs of the private subnets"
  value       = module.spoketransit2.private_subnet_cidrs
}

output "spoketransit2_internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.spoketransit2.internet_gateway_id
}

output "spoketransit2_nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.spoketransit2.nat_gateway_id
}