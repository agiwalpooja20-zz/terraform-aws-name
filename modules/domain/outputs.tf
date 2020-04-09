output "domain" {
  description = "This is the name of the hosted zone"
  value       = "${aws_route53_zone.domain.name}"
}

output "zone_id" {
  description = "The Hosted Zone ID"
  value       = "${aws_route53_zone.domain.zone_id}"
}

output "name_servers" {
  description = "The default list of name servers (NS) for the zone (delegation set)"
  value       = "${aws_route53_zone.domain.name_servers}"
}
