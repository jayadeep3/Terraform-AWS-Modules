module "vpc" {
  source                      = "./modules/vpc"
  environment                 = local.environment
  vpc_cidr_block              = var.vpc_cidr_block
  allowed_ssh_cidr            = var.allowed_ssh_cidr
}

module "public_subnet" {
  source              = "./modules/public_subnet"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
  environment         = local.environment
}

module "private_subnet" {
  source              = "./modules/private_subnet"
  vpc_id              = module.vpc.vpc_id
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  environment         = local.environment
}

module "internet_gateway" {
  source      = "./modules/internet_gateway"
  vpc_id      = module.vpc.vpc_id
  environment = local.environment
}

module "public_route_table" {
  source            = "./modules/public_route_table"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.public_subnet.public_subnet_id
  igw_id            = module.internet_gateway.igw_id
  environment       = local.environment
}

module "private_route_table" {
  source            = "./modules/private_route_table"
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.private_subnet.private_subnet_id
  environment       = local.environment
}

module "nat_gateway" {
  source            = "./modules/nat_gateway"
  public_subnet_id  = module.public_subnet.public_subnet_id
  environment       = local.environment
}

module "security_group" {
  source            = "./modules/sg"
  environment       = local.environment
  vpc_id            = module.vpc.vpc_id
  allowed_ssh_cidr  = var.allowed_ssh_cidr
}

module "public_ec2" {
  source            = "./modules/public_ec2"
  environment       = local.environment
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  public_subnet_id  = module.public_subnet.public_subnet_id
  security_group_id = module.security_group.security_group
}

module "private_ec2" {
  source            = "./modules/private_ec2"
  environment       = local.environment
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  private_subnet_id = module.private_subnet.private_subnet_id
  security_group_id = module.security_group.security_group
}
module "eks" {
  source       = "./modules/eks_cluster"
  cluster_name = "${var.cluster_name}-${local.environment}"
  private_subnet_id = module.private_subnet.private_subnet_id
  environment = local.environment
  instance_types = var.instance_types
}

module "s3_bucket" {
  source            = "./modules/s3_bucket"
  bucket_name       = "${var.bucket_name}-${local.environment}"
  enable_versioning = true
}

module "vpc_endpoint" {
  source = "./modules/vpc_endpoint"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group
  private_subnet_id = module.private_subnet.private_subnet_id
  aws_region = var.aws_region
}
