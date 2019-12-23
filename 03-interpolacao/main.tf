# Configure the AWS Provider
provider "aws" {
  #shared_credentials_file = "/Users/renato/.ssh/creds-aws-estudos"
}

# Bucket test
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-20122019192932"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.b.id

  block_public_acls   = false
  block_public_policy = false
}

# Upload 1  -file txt com interpolation na versão 0.12
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id # Estamos pegando o id do bucket na AWS, para isso referenciamos o nome do bucket
  key    = "hello_world63.txt" # Nome do arquivo no bucket
  source = "teste.txt"
  acl    = "public-read"
}

# Upload 2 - file txt com interpolation na versão 0.11
resource "aws_s3_bucket_object" "object2" {
  bucket = "${aws_s3_bucket.b.id}" # Estamos pegando o id do bucket na AWS, para isso referenciamos o nome do bucket
  key    = "hello_world2.txt" # Nome do arquivo no bucket
  source = "teste.txt"
}