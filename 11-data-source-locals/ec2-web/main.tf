provider "aws"{

}

module "aws_instance"{
    source = "../instance"
    tags = {
        "Name" = "Remote State"
        "Env" = "Dev"
    }
}

#Backend para armazenar tfstate
terraform {
  backend "s3" {
    bucket = "remote-state-course-dev"
    key    = "ec2/remote_state/ec2.tfstate"
    region = "us-east-1"
  }
}