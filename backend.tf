terraform {
  backend "s3" {
    bucket         = "dev-state-1x"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    use_lockfile   = true # Enables native S3 locking
    }
}



# terraform {
#   backend "s3" {
#     bucket         = "tf-state-ozxcs"
#     key            = "terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "tf-state-table"
#     }
# }