variable "aws_region" {}
variable "vpc_cidr_block" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "availability_zone" {}
variable "ami_id" {}
variable "allowed_ssh_cidr" {
    type = list(string)
}
variable "instance_type" {}
variable "instance_types" {
    type = list(string)
}
variable "cluster_name" {}
variable "bucket_name" {}
