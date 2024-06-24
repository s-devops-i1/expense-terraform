env = "dev"
instance_type = "t3.micro"
zone_id = "Z10377495CKDE7OXJB1E"

#vpc
default_cidr_block = "172.31.0.0/16"
vpc_peering_connection_id = "pcx-0ea5d304810eba97e"
default_route_table_id    = "rtb-0dfd6bd58ec8c4869"
main_cidr_block = "10.10.0.0/24"
default_vpc_id    = "vpc-0d777bc0eeb02d730"

frontend_subnets     = ["10.10.0.0/27", "10.10.0.32/27"]
backend_subnets      = ["10.10.0.64/27", "10.10.0.96/27"]
db_subnets           = ["10.10.0.128/27", "10.10.0.160/27"]
availability_zones   = ["us-east-1a", "us-east-1b"]


