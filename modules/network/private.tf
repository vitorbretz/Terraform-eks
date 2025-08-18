resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = "${data.aws_region.current.id}a"
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)

  tags = merge(
    var.tags,
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
    var.tags,
    {
      Name                              = "${var.project_name}-private-subnet-1b"
      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}


resource "aws_route_table_association" "eks_private_route_table_association_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}

resource "aws_route_table_association" "eks_private_route_table_association_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id
}