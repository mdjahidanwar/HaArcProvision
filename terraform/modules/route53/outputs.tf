output "zone_id" {
  value       = aws_route53_zone.dns_zone.zone_id
  description = "Route 53 Hosted Zone ID"
}

output "record_name" {
  value       = aws_route53_record.a_record.name
  description = "Route 53 A Record Name"
}
