variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for the EKS cluster"
}

variable "environment" {}
variable "instance_types" {}