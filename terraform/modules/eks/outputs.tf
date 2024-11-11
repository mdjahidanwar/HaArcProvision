output "cluster_endpoint" {
  value       = aws_eks_cluster.eks_cluster.endpoint
  description = "EKS Cluster endpoint"
}

output "cluster_name" {
  value       = aws_eks_cluster.eks_cluster.name
  description = "EKS Cluster name"
}
