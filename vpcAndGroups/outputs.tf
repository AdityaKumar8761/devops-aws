output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "application_url" {
  description = "URL of the Application Load Balancer"
  value       = "http://${module.ec2.alb_dns_name}"
}

output "database_endpoint" {
  description = "Endpoint for the RDS database"
  value       = module.rds.rds_endpoint
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.s3.bucket_id
}
