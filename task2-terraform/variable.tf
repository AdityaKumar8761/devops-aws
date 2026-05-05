variable "bucket_list" {
  description = "List of S3 bucket names"
  type        = list(string)
}

variable "bucket_map" {
  description = "Map of bucket names"
  type        = map(string)
}