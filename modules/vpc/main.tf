resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = "vpc-${var.environment}"
    Environment = var.environment
  }
}
