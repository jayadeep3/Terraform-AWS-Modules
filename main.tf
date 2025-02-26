provider "aws" {
  region = var.region
}

locals {
  environment = terraform.workspace
}

module "vpc" {
  source            = "./modules/vpc"
  environment       = local.environment
  vpc_cidr_block    = lookup(var.vpc_cidr_block, local.environment, "10.0.0.0/16")
  subnet_cidr_block = lookup(var.subnet_cidr_block, local.environment, "10.0.1.0/24")
  availability_zone = lookup(var.availability_zone, local.environment, "ap-south-1a")
  allowed_ssh_cidr  = var.allowed_ssh_cidr
}

module "ec2" {
  source            = "./modules/ec2"
  environment       = local.environment
  instance_type     = lookup(var.instance_type, local.environment, "t2.micro")
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
}