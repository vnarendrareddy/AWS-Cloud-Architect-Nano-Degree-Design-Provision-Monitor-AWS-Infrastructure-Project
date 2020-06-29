provider "aws" {
  region = "us-west-2"
  access_key = "AKIAUAYECC42OSWR6ZE3"
  secret_key = "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"
}

variable "subnet_prv1" {
  description = "Subnet 1"
  default = "subnet-f722f3aa"
}
variable "ami" {
  description = "ami"
  default = "ami-0e34e7b9ca0ace12d"
}

resource "aws_instance" "UdacityT2" {
  count = 4
  ami = "${var.ami}"
  subnet_id ="${var.subnet_prv1}"
  instance_type = "t2.micro"
   tags = {
    Terraform   = "true"
    Environment = "udacity t2"
  }
}  

resource "aws_instance" "UdacityM4" {
  count = 2
  ami = "${var.ami}"
  subnet_id ="${var.subnet_prv1}"
  instance_type = "m4.large"
   tags = {
    Terraform   = "true"
    Environment = "udacity t4"
  }
}  


terraform destroy -target aws_instance.UdacityM4