resource "aws_vpc" "dev" {
  cidr_block       = "10.10.0.0/24"


  tags = {
    Name = var.env
  }
}

resource "aws_subnet" "zone-1" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.10.0.0/24"

  tags = {
    Name = "zone-1"
  }
}

resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = "vpc-0d777bc0eeb02d730"
  vpc_id        = aws_vpc.dev.id
  auto_accept   = true

  tags  = {
    Name = "peering"
  }
}

resource "aws_route" "default" {
  route_table_id            = aws_vpc.dev.default_route_table_id
  destination_cidr_block    = "172.31.0.0/16"
  vpc_peering_connection_id = "pcx-05c0b1abcb11ecead"
}

resource "aws_route" "main" {
  route_table_id            = "rtb-0695a158ffce61589"
  destination_cidr_block    = "10.10.0.0/24"
  vpc_peering_connection_id = "pcx-05c0b1abcb11ecead"
}

