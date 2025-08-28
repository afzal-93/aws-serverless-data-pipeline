resource "aws_db_instance" "postgres" {
  identifier        = var.rds_db_identifier
  engine            = "postgres"
  engine_version    = "16.3"  # <-- Use a supported version
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = var.db_username
  password          = var.db_password
  publicly_accessible = true
  skip_final_snapshot = true
}
