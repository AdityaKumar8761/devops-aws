variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ASG"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0ebfd941bbafe70c6"
}

variable "alb_ingress_ports" {
  description = "List of ports to allow via ALB ingress"
  type        = list(number)
  default     = [80, 443]
}

variable "ec2_ingress_ports" {
  description = "List of ports to allow via EC2 ingress"
  type        = list(number)
  default     = [80, 443]
}
