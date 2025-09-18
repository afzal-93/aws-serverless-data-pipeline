# Generate random suffix for unique names
resource "random_id" "suffix" {
  byte_length = 4
}

# S3 bucket
resource "aws_s3_bucket" "raw_data" {
  bucket = "my-raw-data-bucket-${random_id.suffix.hex}"
  acl    = "private"

  tags = {
    Name = "RawDataBucket"
  }
}

# RDS Postgres instance
resource "aws_db_instance" "postgres" {
  identifier             = "my-postgres-db-${random_id.suffix.hex}"
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = "myadminuser"                     # safe username
  password               = "ChangeThisToAStrongPassword123!" # replace with secure password
  publicly_accessible    = true
  skip_final_snapshot    = true
  backup_retention_period = 7
  auto_minor_version_upgrade = true

  tags = {
    Name = "MyPostgresDB"
  }
}

