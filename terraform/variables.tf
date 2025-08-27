variable "raw_bucket_name" {
  description = "Name of the raw data S3 bucket"
  type        = string
}

variable "rds_db_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS database"
  type        = string
  sensitive   = true
}
