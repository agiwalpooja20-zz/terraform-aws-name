variable "environment" {
  description = "The name of the environment"
}

variable "zone" {
  description = "The name of the hosted zone, e.g. integration.us or ninja.foo.bar, etc"
}

variable "comment" {
  description = "A comment for the hosted zone"
}

variable "tags" {
  description = "Additional default tags to add all resources"
  type        = "map"
  default     = {}
}
