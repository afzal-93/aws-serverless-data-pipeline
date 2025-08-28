output "s3_raw_bucket_name" {
  value = aws_s3_bucket.raw_data.bucket
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}
