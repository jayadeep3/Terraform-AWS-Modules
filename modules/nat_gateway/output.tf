output "nat_gateway" {
  value = aws_nat_gateway.nat.id
}

output "eip" {
  value = aws_eip.nat_eip
}