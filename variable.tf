variable "tags"{
  type = map(string)
  default = {
    "ENV" = "TEST",
    "Managed By" = "Terraform",
    "Purpose" = "Jenkins"
  }
}

variable "sg_name" {
  type = string
  default = "jenkins"
}

variable "instance_type" {
  type = string
  default = "t3.small"
}

variable "instances" {
  type = map(string)
  default = {
    master = {
      instance_type = "t3.small"
    },
    worker = {
      instance_type = "t3.micro"
    }
  }
}