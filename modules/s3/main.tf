# resource "aws_s3_bucket" "my-bucket" {
#   bucket = var.bucket_name

#   tags = {
#     name = var.bucket_name
#   }
# }

# # Enable versioning
# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.my-bucket.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# # Enable encryption
# # resource "aws_kms_key" "mykey" {
# #   description             = "This key is used to encrypt bucket objects"
# #   deletion_window_in_days = 10
# # }

# resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
#   bucket = aws_s3_bucket.my-bucket.bucket

#   rule {
#     apply_server_side_encryption_by_default {
#     #   kms_master_key_id = aws_kms_key.mykey.arn
#       sse_algorithm = "AES256"
#     }
#   }
# }