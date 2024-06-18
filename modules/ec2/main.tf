resource "aws_instance" "web" {
  ami                    = "ami-0cf7b2f456cd5efd4"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0443fa4e2e19d35d7" 
  vpc_security_group_ids = ["sg-0ae55a9eb8dfcfdb4"]  
  key_name               = "Swaraj-keys"



  tags = {
    Name = "HelloWorld"
  }
}

