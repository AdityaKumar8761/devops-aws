output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet_terraform.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet_terraform.id
}