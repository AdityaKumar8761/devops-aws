region             = "us-east-1"
environment        = "dev" # Change to "prod" for production
db_name            = "myappdb"
db_username        = "admin"
db_password        = "SuperSecretPassword123!"          # Change this before genuine deployment
bucket_name        = "my-unique-app-data-bucket-123456" # S3 bucket names must be globally unique
instance_type      = "t3.micro"
availability_zones = ["us-east-1a", "us-east-1b"]
