resource "aws_route53_zone" "dns_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "a_record" {
  zone_id = aws_route53_zone.dns_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.global_accelerator.accelerator_dns
    zone_id                = module.global_accelerator.zone_id
    evaluate_target_health = true
  }
}
