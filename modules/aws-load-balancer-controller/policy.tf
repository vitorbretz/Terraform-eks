resource "aws_iam_policy" "eks_controller_policy" {
  name = "${var.project_name}-aws-load-balancer-controller-policy"

  policy = file("${path.module}/controller.json")
  tags   = var.tags
}