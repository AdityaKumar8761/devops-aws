resource "aws_key_pair" "aws-key" {
  key_name   = "aws-key"
  public_key = file("~/.ssh/id_rsa.pub")
}



resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = "t3.micro"
  availability_zone = "us-east-1a"
  key_name = aws_key_pair.aws-key.public_key
#   subnet_id =
#   vpc_security_group_ids =

  root_block_device {
    volume_size =  20
    volume_type = "gp2"
    delete_on_termination = true
    tags ={
        Name = "my-root-volume"
    }
  }
  

  tags = {
    Name = "HelloWorld"
  }
}

