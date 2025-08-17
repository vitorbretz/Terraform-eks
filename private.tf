resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = "${data.aws_region.current.id}a"
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}-private-subnet-1a"
      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = "${data.aws_region.current.id}b"
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}-private-subnet-1b"
      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}
