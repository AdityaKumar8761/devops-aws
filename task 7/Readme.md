7.Create a policy allowing a user to:
View EC2 instances
Start & Stop instances
NOT terminate instances

1.go to policy
2.create policy
3.go to json 
	used code 
	{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "AllowViewEC2",
			"Effect": "Allow",
			"Action": [
				"ec2:Describe*"
			],
			"Resource": "*"
		},
		{
			"Sid": "AllowStartStopEC2",
			"Effect": "Allow",
			"Action": [
				"ec2:StartInstances",
				"ec2:StopInstances"
			],
			"Resource": "*"
		},
		{
			"Sid": "DenyTerminateEC2",
			"Effect": "Deny",
			"Action": [
				"ec2:TerminateInstances"
			],
			"Resource": "*"
		}
	]
}

4.press nex and name the policy
5.create policy


done
