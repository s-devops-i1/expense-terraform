resource "aws_vpc" "dev" {
  cidr_block       = var.main_cidr_block


  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "frontend" {
  count                =  length(var.frontend_subnets)
  vpc_id               =  aws_vpc.dev.id
  cidr_block           =  var.frontend_subnets[count.index]
  availability_zone    =  var.availability_zones[count.index]

  tags = {
    Name = "${var.env}-frontend-subnets-${count.index+1}"
  }
}

resource "aws_subnet" "backend" {
  count                =  length(var.backend_subnets)
  vpc_id               =  aws_vpc.dev.id
  cidr_block           =  var.backend_subnets[count.index]
  availability_zone    =  var.availability_zones[count.index]

  tags = {
    Name = "${var.env}-backend-subnets-${count.index+1}"
  }
}

resource "aws_subnet" "db" {
  count                =  length(var.db_subnets)
  vpc_id               =  aws_vpc.dev.id
  cidr_block           =  var.db_subnets[count.index]
  availability_zone    =  var.availability_zones[count.index]

  tags = {
    Name = "${var.env}-db-subnets-${count.index+1}"
  }
}

resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = var.default_vpc_id
  vpc_id        = aws_vpc.dev.id
  auto_accept   = true

  tags  = {
    Name = "${var.env}-peering"
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
#
