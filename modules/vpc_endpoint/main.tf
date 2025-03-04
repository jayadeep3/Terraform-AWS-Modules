resource "aws_vpc_endpoint" "api_gateway" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.execute-api"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.private_subnet_id
  security_group_ids = [var.security_group_id]
}
