provider "aws" {
  region = var.region
}

module "iam" {
  source           = "./modules/iam"
  s3_bucket_name   = var.s3_bucket_name
}

module "ec2" {
  source          = "./modules/ec2"
  ami_id          = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  subnet_id       = var.subnet_id
  security_group_id = module.security_group.id
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = var.vpc_id
}

module "rds" {
  source       = "./modules/rds"
  db_instance_identifier = var.rds_instance_identifier
  db_username   = var.rds_db_username
  db_password   = var.rds_db_password
  subnet_ids    = var.subnet_ids
  db_name       = var.db_name
}

module "redis" {
  source         = "./modules/redis"
  redis_cluster_name = var.redis_cluster_name
  node_type      = var.redis_node_type
  num_nodes      = var.redis_num_nodes
  subnet_ids     = var.subnet_ids
}

module "route53" {
  source = "./modules/route53"
  hosted_zone_name = var.hosted_zone_name
  domain_name = var.domain_name
}

module "cloudfront" {
  source = "./modules/cloudfront"
  origin_domain_name = aws_s3_bucket.static_assets.bucket_regional_domain_name
}

module "global_accelerator" {
  source = "./modules/global_accelerator"
  name = "global-accelerator"
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.eks_cluster_name
  node_instance_type = var.eks_node_instance_type
  subnet_ids      = var.subnet_ids
}

resource "aws_s3_bucket" "static_assets" {
  bucket = var.s3_bucket_name

  website {
    index_document = "index.html"
    # other configurations as required
  }
}

resource "aws_route53_record" "api_record" {
  zone_id = module.route53.hosted_zone_id
  name    = "api.${var.domain_name}"
  type    = "A"
  alias {
    name                   = aws_globalaccelerator_accelerator.main.dns_name
    zone_id                = aws_globalaccelerator_accelerator.main.dns_name
    evaluate_target_health = true
  }
}

resource "aws_globalaccelerator_accelerator" "main" {
  name          = "my-global-accelerator"
  enabled       = true
  ip_address_type = "IPV4"
}
