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

}