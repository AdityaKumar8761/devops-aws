terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "map_buckets" {
  for_each = var.bucket_map

  bucket = each.value

  tags = {
    Name = each.value
    Enironment ="demo"
  }
}



