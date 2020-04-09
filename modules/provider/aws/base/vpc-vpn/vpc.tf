module "vpc_name" {
  source = "../name"

  providers {
    random = "random"
  }

  environment = "${var.environment}"
  resource    = "vpc-vpn"
}

# Provision the VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.49.0"

  name = "${module.vpc_name.name}"
  azs  = ["${local.azs}"]
  cidr = "${local.cidr}"

  ##### Subnets
  # For details on how its been split up, please see
  # https://opengovinc.atlassian.net/wiki/spaces/ENGOPS/pages/678559796/Cloud+Network+Architecture

  # Subnets
  public_subnets     = ["${local.public_subnets}"]
  public_subnet_tags = "${map("subnet-purpose", "public")}"
  ##### VPC Options
  create_database_subnet_group     = false
  enable_dns_support               = true
  enable_dns_hostnames             = true
  enable_nat_gateway               = false
  map_public_ip_on_launch          = false
  assign_generated_ipv6_cidr_block = false
  tags                             = "${merge(map("environment", var.environment, "vpn", true), module.aws_global.tags, var.tags)}"
}
