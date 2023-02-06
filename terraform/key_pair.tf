resource "aws_key_pair" "ssh_key_variable" {
  key_name   = "ssh_key_aws"
  public_key = var.public_key
}