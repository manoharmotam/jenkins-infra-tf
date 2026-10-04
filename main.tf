resource "aws_instance" "jenkins_infra" {
  for_each = var.instances
  ami = local.ami_id
  instance_type = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins[each.key].id]
  key_name = "ami2"

  tags = merge(var.tags, {
    "Name" = "jenkins-${each.key}"
  })
}

resource "aws_security_group" "jenkins" {
  for_each = var.instances

  name = "jenkins-${each.key}"
  description = "SG group created for jenkins ${each.key} node"

  tags = merge(var.tags, {
    "Name" = "jenkins-${each.key}"
  })
}

# resource "aws_security_group" "jenkins-worker" {
#     vpc_id = aws_vpc.main.id
#     name = "jenkins-worker"

    
#     description = "SG group created for worker node"
# }