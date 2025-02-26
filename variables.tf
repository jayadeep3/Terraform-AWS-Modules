variable "region" {
  type = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = map(string)
  default = {
    dev  = "t2.micro"
    demo = "t2.small"
    prod = "t2.medium"
  }
}

variable "availability_zone" {
  type = map(string)
  default = {
    dev  = "ap-south-1a"
    demo = "ap-south-1b"
  }
}

variable "subnet_cidr_block" {
  type = map(string)
  default = {
    dev  = "10.0.1.0/24"
    demo = "10.0.2.0/24"
  }
}

variable "vpc_cidr_block" {
  type = map(string)
  default = {
    dev  = "10.0.0.0/16"
    demo = "10.0.0.0/18"
  }
}

variable "allowed_ssh_cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}