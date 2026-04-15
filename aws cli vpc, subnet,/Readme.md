10. Using only AWS CLI:
Create a custom VPC
Create 2 public subnets (pub/pvt)
Create Internet Gateway
Create NAT Gateway
Create Route Table 
Create Security Group
Launch 2 EC2 instances (1 in each Subnet)
Install Nginx via user data
Create Application Load Balancer
Register instances
Test via ALB DNS


in aws cli
1.create vpc with cidr 10.0.0.0/16
2.create private subnet - 10.0.2.0/24
3.create public subnet - 10.0.1.0/24
4.create ig
5.attach it to vpc
6.allocate elastic ip
7.create nat gate in public subnet
8.configure public route table 
9.configure private route table
10.create security gourp with HTTP 80 and SSH 22
11.lanch 2 ec2
12.use bash to install nginx inside both of them 
13. create target group and register both EC2 instance 
14. create ALB
15. get the DNS and check
