output "instance_id" {
  value       = aws_instance.clickhouse_instance.id
  description = "The ID of the EC2 instance hosting ClickHouse"
}

output "public_ip" {
  value       = aws_instance.clickhouse_instance.public_ip
  description = "Public IP of the EC2 instance hosting ClickHouse"
}

output "ebs_volume_id" {
  value       = aws_ebs_volume.clickhouse_data.id
  description = "ID of the EBS volume attached to the EC2 instance"
}

output "backup_plan_id" {
  value       = aws_backup_plan.clickhouse_backup.id
  description = "Backup plan ID for ClickHouse EBS volume"
}

output "security_group_id" {
  value       = aws_security_group.ec2_sg.id
  description = "Security Group ID for the EC2 instance"
}
