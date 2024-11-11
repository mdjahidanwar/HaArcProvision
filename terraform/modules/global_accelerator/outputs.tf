output "accelerator_dns" {
  value       = aws_globalaccelerator_accelerator.accelerator.dns_name
  description = "Global Accelerator DNS"
}
