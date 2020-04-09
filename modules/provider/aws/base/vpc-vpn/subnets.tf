# Global settings
module "aws_global" {
  source = "../../global/"
}

# Get the current region
data "aws_region" "current" {}

locals {
  region    = "${data.aws_region.current.name}"
  azs       = ["${module.aws_global.region_to_azs[local.region]}"]
  azs_count = "${length(local.azs)}"
  cidr      = "${var.starting_address}/22"

  # The number of loops to make for creating each of the subnet CIDR blocks
  # We add an additional one which will be the start of the next type of CIDR blocks
  loops = "${module.aws_global.max_azs + 1}"
}

##### Public subnets
## Range:  172.X.0.0/25 - 172.X.2.255
data "template_file" "public" {
  count    = "${local.loops}"
  template = "$${subnet}"

  vars {
    subnet = "${cidrsubnet(local.cidr, 3, count.index)}"
  }
}

locals {
  public_subnets_extra = ["${data.template_file.public.*.rendered}"]
  public_subnets       = ["${slice(local.public_subnets_extra, 0, local.azs_count)}"]
}

##### Reserved addresses
## Range:  172.X.3.0 - 172.X.3.255
locals {
  reserved_start_address = "${substr(local.public_subnets_extra[module.aws_global.max_azs], 0, length(local.public_subnets_extra[module.aws_global.max_azs]) - 3)}"

  reserved_cidr_blocks = [
    "${format("${local.reserved_start_address}/%d", 24)}",
  ]
}
