provider "aws" {
}
#Random
resource "random_id" "bucket" {
  byte_length = 8
}
module "bucket" {
  source = "./s3"
  name = "my-bucket-${random_id.bucket.hex}"
  versioning = true
  tags = {
      "Name" = "Meu bucket com arquivo"
  }
  create_object = true
  object_key = "files/${random_id.bucket.dec}.txt"
  object_source = "file.txt"
}
module "bucket-2" {
  source = "./s3"
  name = "my-bucket-2-${random_id.bucket.hex}"
}
#Create a instance
module "aws_instance" {
  source = "./instance"
  tags = {
    "Name" = "Testando"
    "Env" = "Dev"
  }
}
