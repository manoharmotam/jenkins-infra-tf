terraform {
  required_providers {
    aws = {
      version = "6.48.0"
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "manoharmotam-remote-state-test"
    key = "jenkins/jenkins.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}