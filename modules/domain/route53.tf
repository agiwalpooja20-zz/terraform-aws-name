# Global settings
module "aws_global" {
  source = "../../global/"
}

# The zone to be used for the kubernetes cluster
resource "aws_route53_zone" "domain" {
  name    = "${var.zone}"
  comment = "${var.comment}"

  tags = "${merge(map("environment", var.environment), module.aws_global.tags, var.tags)}"
}
