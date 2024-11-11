resource "aws_db_instance" "rds_instance" {
  identifier         = var.db_name
  instance_class     = var.instance_type
  allocated_storage  = 20
  engine             = "mysql"
  engine_version     = "8.0"
  username           = var.db_user
  password           = var.db_password
  skip_final_snapshot = true
  multi_az           = true
}
