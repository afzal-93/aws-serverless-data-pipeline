# Create the S3 bucket
resource "aws_s3_bucket" "raw_data" {
  bucket = var.raw_bucket_name
}

# Set ACL for the S3 bucket
resource "aws_s3_bucket_acl" "raw_data_acl" {
  bucket = aws_s3_bucket.raw_data.id
  acl    = "private"
}

# Create RDS instance
resource "aws_db_instance" "postgres" {
  identifier             = var.rds_db_identifier
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "13.4"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = true
}
