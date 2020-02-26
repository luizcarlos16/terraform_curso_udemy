variable "ami" {
    default = "ami-00068cd7555f543d5"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "tags" {
  type = map(string)
  default = {}
}
