resource "aws_instance" "my_web_server" {
  ami           = "ami-0fd54cba47d6e98dc"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install epel -y
    sudo yum install -y ansible
  EOF

  tags = {
    Name = var.instance_name
  }
}