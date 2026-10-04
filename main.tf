resource "aws_instance" "jenkins_infra" {
  for_each = var.instances
  ami = local.ami_id
  instance_type = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins[each.key].id]
  key_name = "ami2"

  root_block_device {
    delete_on_termination = true
    encrypted = false
    volume_size = "50"
    volume_type = "gp3"

    tags = merge(var.tags, {
      "Name" = "jenkins-${each.key}"
  })
}

  tags = merge(var.tags, {
    "Name" = "jenkins-${each.key}"
  })

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "jenkins" {
  for_each = var.instances

  name = "jenkins-${each.key}"
  description = "SG group created for jenkins ${each.key} node"

  dynamic "ingress" {
    for_each = concat(
      local.common_ingress_rules, 
      lookup(local.extra_ingress_rules, each.key, [])
    )

    content {
      from_port = ingress.value.port
      to_port = ingress.value.port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr != null ? ingress.value.cidr : null
      security_groups = ingress.value.sg_id != null ? ingress.value.sg_id : null
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
  }

  tags = merge(var.tags, {
    "Name" = "jenkins-${each.key}"
  })

  lifecycle {
    create_before_destroy = true
  }
}