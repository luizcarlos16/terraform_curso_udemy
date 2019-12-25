# Configure the AWS Provider
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

# Create a Instance
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.type
}
