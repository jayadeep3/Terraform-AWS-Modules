variable "aws_region" {}
variable "vpc_id" {}
variable "private_subnet_id" {
  type = list(string)
}
variable "security_group_id" {}
