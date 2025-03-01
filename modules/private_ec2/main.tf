resource "aws_instance" "private" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id.id
  vpc_security_group_ids = [ var.security_group_id ]

  tags = {
    Name        = "ec2-${var.environment}-private"
    Environment = var.environment
  }
}
