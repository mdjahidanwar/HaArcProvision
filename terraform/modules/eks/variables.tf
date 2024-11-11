variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for EKS"
}

variable "instance_type" {
  type        = string
  description = "Instance type for EKS nodes"
}

variable "node_count" {
  type        = number
  description = "Desired node count in EKS"
}
