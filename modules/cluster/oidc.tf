data "tls_certificate" "eks_oids_tls_certicate" {
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks_oidc" {
  client_id_list = [
    "sts.amazonaws.com"
  ]
  thumbprint_list = data.tls_certificate.eks_oids_tls_certicate.certificates[*].sha1_fingerprint
  url             = data.tls_certificate.eks_oids_tls_certicate.url
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks-oidc-provider"
    }
  )
}
