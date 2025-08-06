resource "aws_s3_bucket" "raw_data" {
  bucket = var.s3_raw_bucket_name
  resource "aws_s3_bucket_acl" "raw_data_acl" {
  bucket = aws_s3_bucket.raw_data.id
  acl    = "private"
}

}

resource "aws_db_instance" "postgres" {
  identifier          = "processed-data-db"
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  db_name = var.rds_db_name
  username            = var.rds_username
  password            = var.rds_password
  publicly_accessible = true
  skip_final_snapshot = true
}

