variable "db_name" {
  type        = string
  description = "RDS Database name"
}

variable "instance_type" {
  type        = string
  description = "Instance type for RDS"
}

variable "db_user" {
  type        = string
  description = "RDS username"
}

variable "db_password" {
  type        = string
  description = "RDS password"
  sensitive   = true
}
