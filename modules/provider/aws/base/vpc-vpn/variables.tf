variable "environment" {
  description = "The environment the VPC belongs to"
}

variable "starting_address" {
  description = "The starting address for a /22 CIDR block to assign the VPC. Must not be in CIDR block annotation."
}

variable "tags" {
  description = "Additional default tags to add all resources"
  default     = {}
}
