# S3 Bucket
resource "aws_s3_bucket" "raw_data" {
  bucket = "my-raw-data-bucket-${random_id.suffix.hex}" # ✅ ensures unique bucket name
}

resource "random_id" "suffix" {
  byte_length = 4
}

# RDS PostgreSQL
resource "aws_db_instance" "postgres" {
  identifier           = "my-postgres-db"
  engine               = "postgres"
  engine_version       = "16.3"   # ✅ supported version
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "myadmin"
  password             = "password1993!" # ⚠️ change for security
  publicly_accessible  = true
  skip_final_snapshot  = true
}

