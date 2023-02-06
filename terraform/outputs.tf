output "instance_public_ip" {
  value = aws_instance.application_instance.public_ip
}