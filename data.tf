data "aws_ami" "ami2" {

  owners = ["137112412989"]
  most_recent = true
  filter {
    name = "name"
    values = ["al2023-ami-2023.12.20260918.0-kernel-6.18-x86_64"]
  }

  filter {
    name = "root-device-name"
    values = ["/dev/xvda"]
  }
}

data "aws_security_group" "bastion" {
  filter {
    name = "group-name"
    values = ["launch-wizard-1"]
  }

  filter {
    name = "vpc-id"
    values = ["vpc-01c6ca06f7ddcb51e"]
  }
}
