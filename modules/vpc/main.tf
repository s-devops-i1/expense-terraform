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


