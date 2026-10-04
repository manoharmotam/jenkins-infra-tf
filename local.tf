locals {
  ami_id = data.aws_ami.ami2.id
  bastion_sg_id = data.aws_security_group.bastion.id
  common_ingress_rules= [
    { 
      port = 22
      protocol = "TCP"
      sg_id = ["bastion_sg_id"]
      cidr = null
    }
  ]
  extra_ingress_rules = {
    master = [
      {
        port = 8080
        protocol = "TCP"
        cidr = ["0.0.0.0/0"]
        sg_id = null
      }
    ]  
    worker = []
  }
}