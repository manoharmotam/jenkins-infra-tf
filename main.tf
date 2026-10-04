resource "aws_instance" "jenkins_infra" {
  for_each = var.instances
  ami = local.ami_id
  instance_type = each.value.instance_type
  security_groups = [aws_security_group.jenkins_infra.id,
    aws.
  ]
  key_name = "ami2"

  tags = merge(var.tags, {
    "Name" = "jenkins-${each.key}"
  })
}

resource "aws_security_group" "jenkins" {
    vpc_id = aws_vpc.main.id
    name = "jenkins-master"
    description = "SG group created for jenkins ${each.key} node"
}

resource "aws_security_group" "jenkins-worker" {
    vpc_id = aws_vpc.main.id
    name = "jenkins-worker"

    
    description = "SG group created for worker node"
}