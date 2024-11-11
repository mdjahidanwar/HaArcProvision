resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = var.origin_bucket_domain
    origin_id   = "S3-${var.origin_bucket_id}"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = "index.html"
}
