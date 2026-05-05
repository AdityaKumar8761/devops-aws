terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.41.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}



//resource <provider>_<resource_type> "name" {
    //config options...
    //key = "values"
//}