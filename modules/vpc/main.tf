resource "aws_vpc" "dev" {
  cidr_block       = "10.10.0.0/24"


  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "zone-1" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.10.0.0/24"

  tags = {
    Name = "${var.env}-subnet"
  }
}

resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = "vpc-0d777bc0eeb02d730"
  vpc_id        = aws_vpc.dev.id
  auto_accept   = true

  tags  = {
    Name = "${var.env}-peer"
  }
}

resource "aws_route" "main" {
  route_table_id            = aws_vpc.dev.default_route_table_id
  destination_cidr_block    = var.default_cidr_block
  vpc_peering_connection_id = var.vpc_peering_connection_id
}

resource "aws_route" "default-vpc" {
  route_table_id            = var.default_route_table_id
  destination_cidr_block    = var.main_cidr_block
  vpc_peering_connection_id = var.vpc_peering_connection_id
}

