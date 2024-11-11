variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for EC2"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair name"
}

variable "instance_name" {
  type        = string
  description = "Name tag for the EC2 instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with the EC2 instance"
}

variable "availability_zone" {
  type        = string
  description = "Availability Zone for the EC2 instance and EBS"
}

variable "root_volume_size" {
  type        = number
  description = "Root volume size in GB"
  default     = 20
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volume size in GB for ClickHouse data"
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group for EC2 instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the EC2 instance security group"
}

variable "allowed_ingress_port" {
  type        = number
  description = "Allowed ingress port for EC2 security group"
}

variable "allowed_ingress_cidr_blocks" {
  type        = list(string)
  description = "Allowed ingress CIDR blocks for EC2 security group"
}
