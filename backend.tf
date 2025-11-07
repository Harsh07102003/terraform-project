terraform {
  backend "s3" {
    bucket         = "tf-state-ozxcs"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "tf-state-table"
    }
}