output "bucket_id" {
  value       = aws_s3_bucket.bucket.id
  description = "S3 Bucket ID"
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "S3 Bucket ARN"
}
