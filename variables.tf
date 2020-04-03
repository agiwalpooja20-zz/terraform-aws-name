variable "environment" {
  description = "The name of the environment"
}

variable "domain" {
  description = "Owner'"
  default     = ""
}

variable "resource" {
  description = "The AWS resource type (e.g. EKS, EC2, S3, etc)"
}
