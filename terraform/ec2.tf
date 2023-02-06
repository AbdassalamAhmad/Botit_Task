resource "aws_instance" "application_instance" {
  ami                         = var.ami
  instance_type               = var.ec2_type
  availability_zone           = "${var.region}a"
  key_name                    = aws_key_pair.ssh_key_variable.key_name
  vpc_security_group_ids      = [aws_security_group.InstanceSG.id]
  associate_public_ip_address = true
  
  tags = {
    Name = "Flask-App"
  }

  # Install Docker && Docker-compose
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user
    curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    EOF
}