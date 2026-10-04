locals {
  ami_id = data.aws_ami.ami2.id
  instance_type = var.instance_type
  
}