4.Create ec2 instance, create some files/dir
Capture snapshot of ebs volume
Create a new ebs vol from that snapshot 
Attach it to ec2 instance 
See it the files still exist.


steps 

1. launch an ec2 instancd -> create a file print hello world
2.go to volume and create an snapshot
3.go to snapshot and create and extra volume form snapshot
4.go to volume and attach it the ec2 in the same az
5.connect to ec2 list lsblk for the seeing the mound 
6.mound the volume in a folder we make 
7.ls in the folder 
