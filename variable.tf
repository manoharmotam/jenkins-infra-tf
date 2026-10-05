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
  type = map(any)
  default = {
    master = {
      instance_type = "t3.small"
    }
    #    worker = {
    # instance_type = "t3.micro"
    # }
  }
}

variable "key_name" {
  type = string
  default = "ami2"
}

variable "ssh_port"{
  default = 22
}

variable "custom_port"{
  default = 8080
}
