resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = "vpc-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name        = "subnet-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_security_group" "this" {
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  tags = {
    Name        = "sg-${var.environment}"
    Environment = var.environment
  }
}
