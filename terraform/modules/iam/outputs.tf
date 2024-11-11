output "cloudfront_s3_access_role_arn" {
  value       = aws_iam_role.cloudfront_s3_access_role.arn
  description = "ARN of the CloudFront S3 access role"
}

output "global_accelerator_role_arn" {
  value       = aws_iam_role.global_accelerator_role.arn
  description = "ARN of the Global Accelerator role"
}

output "ec2_s3_access_role_arn" {
  value       = aws_iam_role.ec2_s3_access_role.arn
  description = "ARN of the EC2 role with access to S3"
}
