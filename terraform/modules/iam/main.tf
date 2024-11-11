# IAM Role for CloudFront to Access S3
resource "aws_iam_role" "cloudfront_s3_access_role" {
  name = "cloudfront_s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for CloudFront to Access S3
resource "aws_iam_policy" "cloudfront_s3_policy" {
  name        = "cloudfront_s3_policy"
  description = "Policy to allow CloudFront access to S3 buckets for static assets and videos."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject"],
        Resource = ["arn:aws:s3:::${var.s3_bucket_name}/*"]
      }
    ]
  })
}

# Attach CloudFront S3 Policy to Role
resource "aws_iam_role_policy_attachment" "cloudfront_s3_attachment" {
  role       = aws_iam_role.cloudfront_s3_access_role.name
  policy_arn = aws_iam_policy.cloudfront_s3_policy.arn
}

# IAM Role for Global Accelerator
resource "aws_iam_role" "global_accelerator_role" {
  name = "global_accelerator_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "globalaccelerator.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for Global Accelerator to Route API Requests
resource "aws_iam_policy" "global_accelerator_policy" {
  name        = "global_accelerator_policy"
  description = "Policy to allow Global Accelerator to route API requests."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["elasticloadbalancing:*"],
        Resource = "*"
      }
    ]
  })
}

# Attach Global Accelerator Policy to Role
resource "aws_iam_role_policy_attachment" "global_accelerator_attachment" {
  role       = aws_iam_role.global_accelerator_role.name
  policy_arn = aws_iam_policy.global_accelerator_policy.arn
}

# IAM Role for EC2 to access S3 with signed URLs
resource "aws_iam_role" "ec2_s3_access_role" {
  name = "ec2_s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# IAM Policy for EC2 to access S3 with signed URLs
resource "aws_iam_policy" "ec2_s3_policy" {
  name        = "ec2_s3_policy"
  description = "Policy to allow EC2 instances to access S3 with signed URLs for video access."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject", "s3:ListBucket"],
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_name}/*"
        ]
      }
    ]
  })
}

# Attach EC2 S3 Policy to Role
resource "aws_iam_role_policy_attachment" "ec2_s3_attachment" {
  role       = aws_iam_role.ec2_s3_access_role.name
  policy_arn = aws_iam_policy.ec2_s3_policy.arn
}
