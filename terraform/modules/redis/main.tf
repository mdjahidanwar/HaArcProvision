resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = var.cluster_name
  engine               = "redis"
  node_type            = var.instance_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
}
