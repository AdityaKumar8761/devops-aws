Using only CLI Create s3 bucket
1. Make the bucket policy public 
2. make the bucket accessible to only your a limited user accounts and ips



1.configure aws cli
2. create s3 bucket
aws S3api create-bucket \
--bucket unique-buccket-aditya\
--region ap-south-1\
--create-bucket-configuration LocationConstraint =ap-south-1

3.disapble Block Public Access
aws s3api put-public-access-block\
--bucket unique-buccket-aditya
--public-access-block-configuration\
BlockPlublicAcls=false, #(fake all the parameter = false)

4.make policies for iam user of s3 in json in 
aws s3api put-bucket-policy\
-bucket unique-bucket-aditya\
--policy {{{defind plicy}}}

5.make policies for specific ips in the same manner

