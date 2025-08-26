resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-managed-node-group"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids      = [var.subnet_private_1a, var.subnet_private_1b]
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-node-group"
    }
  )

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_worker,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_ecr,
  ]
}
variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster to associate with the node group"
}

variable "subnet_private_1a" {
  type        = string
  description = "subnet to create EKS cluster az 1a"
}

variable "subnet_private_1b" {
  type        = string
  description = "subnet to create EKS cluster az 1b"
}