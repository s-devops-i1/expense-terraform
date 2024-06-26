env = "dev"
instance_type = "t3.micro"
zone_id = "Z10377495CKDE7OXJB1E"

#vpc
default_cidr_block = "172.31.0.0/16"
vpc_peering_connection_id = "pcx-0432634327228248e"
default_route_table_id    = "rtb-0dfd6bd58ec8c4869"
main_cidr_block = "10.10.0.0/24"
default_vpc_id    = "vpc-0d777bc0eeb02d730"

frontend_subnets     = ["10.10.0.0/28", "10.10.0.16/28"]
backend_subnets      = ["10.10.0.32/28", "10.10.0.48/28"]
db_subnets           = ["10.10.0.64/28", "10.10.0.80/28"]
public_subnets       = ["10.10.0.96/28", "10.10.0.112/28"]
availability_zones   = ["us-east-1a", "us-east-1b"]
bastion_nodes        = ["172.31.36.24/32"]
prometheus_nodes     = ["172.31.37.201/32"]
certificate_arn      = "arn:aws:acm:us-east-1:471112569439:certificate/0a2be12a-fe37-450c-9e33-60ab13354353"
