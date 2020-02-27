provider "aws"{

}

#Backend para armazenar tfstate
terraform {
  backend "s3" {
    bucket = "remote-state-course-dev"
    key    = "ec2/remote_state/ec2.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "ubuntu" {
  owners = ["amazon"]
  most_recent = true
  name_regex = "ubuntu"
}

module "aws_instance-2"{
    source = "../../08-modulos/instance"
    ami = data.aws_ami.ubuntu.id
    # instance_type = var.instance_type
    tags = {
        "Name" = "Remote State"
        "Env" = "Dev"
    }
}
