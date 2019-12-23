# Configure the AWS Provider
provider "aws" {
  #shared_credentials_file = "/Users/renato/.ssh/creds-aws-estudos"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-20122019192932"
  acl    = "private"

  tags = {
    Name        = "My super bucket again 2"
    Environment = "Stg"
  }
}