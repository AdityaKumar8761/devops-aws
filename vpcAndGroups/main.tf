module "vpc" {
  source             = "./modules/vpc"
  environment        = var.environment
  availability_zones = var.availability_zones
}

module "ec2" {
  source             = "./modules/ec2"
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  instance_type      = var.instance_type

  # Wait for NAT to be ready so user_data can download Nginx
  depends_on = [module.vpc]
}

module "rds" {
  source             = "./modules/rds"
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_id          = module.ec2.ec2_sg_id
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
}

module "s3" {
  source      = "./modules/s3"
  environment = var.environment
  bucket_name = var.bucket_name
}
