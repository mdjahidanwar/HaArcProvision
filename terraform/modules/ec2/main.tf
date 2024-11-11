resource "aws_instance" "clickhouse_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  availability_zone      = var.availability_zone
  security_groups        = [aws_security_group.ec2_sg.name]

  root_block_device {
    volume_type = "gp3"
    volume_size = var.root_volume_size
    delete_on_termination = true
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "gp3"
    volume_size = var.ebs_volume_size
    delete_on_termination = false
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ebs_volume" "clickhouse_data" {
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size
  type              = "gp3"
  multi_attach_enabled = true

  tags = {
    Name = "${var.instance_name}-data-volume"
  }
}

resource "aws_ebs_volume_attachment" "clickhouse_attachment" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.clickhouse_data.id
  instance_id = aws_instance.clickhouse_instance.id
}

resource "aws_backup_plan" "clickhouse_backup" {
  name = "${var.instance_name}-backup-plan"
  rule {
    rule_name         = "daily"
    target_vault_name = aws_backup_vault.clickhouse_backup_vault.name
    schedule          = "cron(0 12 * * ? *)"
    lifecycle {
      delete_after = 30
    }
  }
}

resource "aws_backup_vault" "clickhouse_backup_vault" {
  name = "${var.instance_name}-backup-vault"
}

resource "aws_backup_selection" "clickhouse_backup_selection" {
  iam_role_arn = aws_iam_role.backup_role.arn
  name         = "clickhouse-backup"
  resources    = [aws_ebs_volume.clickhouse_data.arn]
  backup_plan_id = aws_backup_plan.clickhouse_backup.id
}

resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = "EC2 Security Group for ClickHouse instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.allowed_ingress_port
    to_port     = var.allowed_ingress_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
