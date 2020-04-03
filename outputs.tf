locals {
  domain = "${ var.domain != "" ? "-${var.domain}-" : "-"}"
}

output "name" {
  description = "The random name generated according to OpenGov best practices"
  value       = "${lower(var.resource)}-${lower(var.environment)}${local.domain}${random_string.name.result}"
}
