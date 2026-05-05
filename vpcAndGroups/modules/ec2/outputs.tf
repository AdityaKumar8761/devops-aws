output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.app.dns_name
}

output "ec2_sg_id" {
  description = "The ID of the EC2 Security Group"
  value       = aws_security_group.ec2.id
}
