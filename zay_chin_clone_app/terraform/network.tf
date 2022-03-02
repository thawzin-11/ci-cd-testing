resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    "name" = "TerraVPC"
  }
}

#Subnets : private
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  count = length(var.private_subnets_cidr)
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Private-${count.index+1}"
  }
}

#Subnets : public
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  count = length(var.public_subnets_cidr)
  cidr_block = element(var.public_subnets_cidr, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Public-${count.index+1}"
  }
  map_public_ip_on_launch = true
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "internet gateway"
  }
}

resource "aws_route_table" "private" {
  # count = length(var.private_subnets_cidr)
  count = 1
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "nat-gateway-02"
  }
}

#Route Table : public subnets through the igw
resource "aws_route" "private" {
  count = 1
  route_table_id = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  # gateway_id = aws_internet_gateway.igw.id
  nat_gateway_id = element(aws_nat_gateway.gw.*.id, count.index)
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets_cidr)
  # count = 1
  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)

}

resource "aws_eip" "gw" {
  # count      = length(var.private_subnets_cidr)
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "gw" {
  # count         = length(var.private_subnets_cidr)
  count = 1
  # subnet_id     = element(aws_subnet.public.*.id, count.index)
  # allocation_id = element(aws_eip.gw.*.id, count.index)
  subnet_id = element(aws_subnet.public.*.id, count.index)
  allocation_id = element(aws_eip.gw.*.id, count.index)
}

resource "aws_route_table" "public" {
  count = 1
  vpc_id = aws_vpc.main.id
  tags = {
    "Name" = "default-route-02"
  }
}

resource "aws_route" "public" {
  count = 1
  route_table_id = element(aws_route_table.public.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets_cidr)
  # count = 1
  subnet_id = element(aws_subnet.public.*.id, count.index)
  route_table_id = element(aws_route_table.public.*.id, count.index)
}