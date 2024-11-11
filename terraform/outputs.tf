output "cloudfront_distribution_id" {
  value       = aws_cloudfront_distribution.cdn.id
  description = "The CloudFront distribution ID"
}

output "global_accelerator_arn" {
  value       = aws_globalaccelerator_accelerator.main.arn
  description = "The ARN of the Global Accelerator"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.static_assets.arn
  description = "The ARN of the S3 bucket"
}

output "route53_record_name" {
  value       = aws_route53_record.api_record.name
  description = "Route53 DNS record for the API"
}

output "rds_instance_endpoint" {
  value       = module.rds.db_endpoint
  description = "The endpoint of the RDS instance"
}

output "redis_cluster_endpoint" {
  value       = module.redis.cluster_endpoint
  description = "The endpoint of the Redis cluster"
}

output "eks_cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "The endpoint of the EKS cluster"
}
