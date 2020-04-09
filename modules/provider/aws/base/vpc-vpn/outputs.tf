output "vpc_name" {
  description = "The name of the VPC"
  value       = "${module.vpc_name.name}"
}

output "azs" {
  description = "The availability zones used in the VPC"
  value       = ["${local.azs}"]
}

#### Unused IP addresses
output "reserved_cidr_blocks" {
  description = "The remaining IP blocks that were not used for any of the subnets"
  value       = "${local.reserved_cidr_blocks}"
}

#### VPC output from the vpc module
output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "${module.vpc.vpc_cidr_block}"
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = "${module.vpc.vpc_main_route_table_id}"
}

output "public_subnets" {
  description = "List of IDs of the public subnets"
  value       = "${module.vpc.public_subnets}"
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = ["${module.vpc.public_subnets_cidr_blocks}"]
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = ["${module.vpc.public_route_table_ids}"]
}
