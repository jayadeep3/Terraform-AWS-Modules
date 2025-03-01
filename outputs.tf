output "vpc_id" {
  description = "ID of the created public VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.public_subnet.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.private_subnet.private_subnet_id
}

output "public_ec2_id" {
  description = "Public EC2 Instance ID"
  value       = module.public_ec2.public_ec2_id
}

output "private_ec2_id" {
  description = "Private EC2 Instance ID"
  value       = module.private_ec2.private_ec2_id
}

output "internet_gateway" {
  value = module.internet_gateway.igw_id
}

output "nat_gateway" {
  value = module.nat_gateway
}