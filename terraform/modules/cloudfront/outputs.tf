output "domain_name" {
  value       = aws_cloudfront_distribution.distribution.domain_name
  description = "CloudFront distribution domain name"
}
