variable "bucket_name" {
  description = "s3 bucket for remote state"
  type = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name for state locking"
  type = string
}