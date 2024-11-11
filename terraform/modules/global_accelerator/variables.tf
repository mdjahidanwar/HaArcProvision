variable "name" {
  type        = string
  description = "Global Accelerator name"
}

variable "endpoint_primary" {
  type        = string
  description = "Primary endpoint for Global Accelerator"
}

variable "endpoint_secondary" {
  type        = string
  description = "Secondary endpoint for Global Accelerator"
}
