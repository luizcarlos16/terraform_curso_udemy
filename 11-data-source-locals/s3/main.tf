provider "aws" {}

resource "random_id" "bucket_2" {
  byte_length = 4
}

data "terraform_remote_state" "web" {
  backend = "s3"
  config = {
    bucket = "remote-state-course-dev"
    key    = "ec2/remote_state/ec2.tfstate"
    region = "us-east-1"
  }
}

module "bucket" {
  source = "../../08-modulos/s3"
  name   = "my-bucket-${random_id.bucket_2.hex}"
  tags = {
    "Name" = "Minhas instancias"
  }
  create_object = true
  object_key    = "instance/instances-${data.terraform_remote_state.web.id}.txt"
  object_source = "output.txt"
}

