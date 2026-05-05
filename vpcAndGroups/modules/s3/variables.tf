variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
