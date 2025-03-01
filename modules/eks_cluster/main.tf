resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.cluster_name}-eks-role-${var.environment}"

  assume_role_policy = jsonencode({
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_eks_cluster" "eks" {
  name     = "${var.cluster_name}-${var.environment}"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.private_subnet_id
  }

  depends_on = [aws_iam_role.eks_cluster_role]
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.cluster_name}-ng-${var.environment}"
  node_role_arn   = aws_iam_role.eks_cluster_role.arn
  subnet_ids      = var.private_subnet_id
  instance_types  = var.instance_types
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}
