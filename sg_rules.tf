resource "aws_security_group_rule" "master_to_worker" {
  type = "ingress"
  security_group_id = aws_security_group.jenkins["worker"].id
  source_security_group_id = aws_security_group.jenkins["master"].id
  
  from_port = 22
  to_port = 22
  protocol = "TCP"
}

resource "aws_security_group_rule" "bastion_to_worker" {
  type = "ingress"
  security_group_id = aws_security_group.jenkins["worker"].id
  source_security_group_id = local.bastion_sg_id
  
  from_port = 22
  to_port = 22
  protocol = "TCP"
}

resource "aws_security_group_rule" "bastion_to_master" {
  type = "ingress"
  security_group_id = aws_security_group.jenkins["master"].id
  source_security_group_id = local.bastion_sg_id
  
  from_port = 22
  to_port = 22
  protocol = "TCP"
}

resource "aws_security_group_rule" "customPort_master" {
  type = "ingress"
  security_group_id = aws_security_group.jenkins["master"].id
  cidr_blocks = ["0.0.0.0/0"]
  
  from_port = 8080
  to_port = 8080
  protocol = "TCP"
}