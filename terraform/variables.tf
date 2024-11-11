variable "region" {
  description = "The AWS region where resources will be deployed"
  type        = string
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for CloudFront and EC2 access"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "ec2_instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instances"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to be used for resources"
  type        = string
}

variable "rds_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "rds_db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "rds_db_password" {
  description = "Password for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "redis_cluster_name" {
  description = "Name of the Redis cluster"
  type        = string
}

variable "redis_node_type" {
  description = "Node type for the Redis instance"
  type        = string
}

variable "redis_num_nodes" {
  description = "Number of nodes in the Redis cluster"
  type        = number
}

variable "hosted_zone_name" {
  description = "Route 53 hosted zone name"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "eks_node_instance_type" {
  description = "Instance type for the EKS nodes"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the application"
  type        = string
}
