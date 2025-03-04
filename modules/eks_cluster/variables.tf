variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for the EKS cluster"
  type        = list(string)
}

variable "environment" {}
variable "instance_types" {
  type        = list(string)
}
