terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend s3 {
    bucket         = "my-terraform-s3-choi" # S3 버킷 이름
    key            = "terraform/terraform.tfstate" # tfstate 저장 경로
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-tfstate-lock" # dynamodb table 이름
  }
}
