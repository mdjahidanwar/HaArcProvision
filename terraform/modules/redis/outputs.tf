output "endpoint" {
  value       = aws_elasticache_cluster.redis_cluster.cache_nodes[0].address
  description = "Redis Endpoint"
}
