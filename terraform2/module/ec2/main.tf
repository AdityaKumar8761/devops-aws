resource "aws_security_group" "sg_dev" {
  name = "ec2_sg"
  vpc_id = aws_vpc.terraform_vpc.id
tags = {
    Name = "sg-dev"
    origin = "Terraform"
    env = "Dev"
}
}

