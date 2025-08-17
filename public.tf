resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  availability_zone       = "${data.aws_region.current.id}a"
  map_public_ip_on_launch = true
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-public-subnet-1a"
      "kubernetes.io/role/elb" = "1"
    }
  )
}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  availability_zone       = "${data.aws_region.current.id}b"
  map_public_ip_on_launch = true
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-public-subnet-1b"
      "kubernetes.io/role/elb" = "1"
    }
  )
}
