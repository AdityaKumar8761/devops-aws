Question
Create 2 VPC's inside 2 different AWS Accounts
Keep CIDR range mutually exclusive
Create the peering Connection b/w them
Create one Public VM & Pvt VM (01) inside VPC - 1
Create one Pvt VM (02) inside VPC - 2
Establish SSH connection from pvt-01  to pvt-02

1.create vpc in both account
2.add make a peering connection in one device addressing to the other 
3.accept he peering 
4.create a security group with all IGMP add the ip of the receiver
5.create ec2 on both 
6.ping <the other ip >
