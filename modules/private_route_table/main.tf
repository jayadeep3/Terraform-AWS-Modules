# Route Table for Private Subnet with NAT Gateway
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "rt-${var.environment}-private"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id.id
  route_table_id = aws_route_table.private.id
}
