# data "aws_ami" "latest_ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical (Ubuntu) AWS Account ID

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id.id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name        = "ec2-${var.environment}-public"
    Environment = var.environment
  }
}
