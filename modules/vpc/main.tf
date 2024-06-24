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

