variable "region" {
  default = "us-east-1"
}

variable "s3_raw_bucket_name" {
  default = "my-raw-data-bucket-afzal-123"
}

variable "rds_username" {
  default = "admin"
}

variable "rds_password" {
  default = "ChangeMe123!"
  sensitive = true
}

variable "rds_db_name" {
  default = "processed_data_db"
}
