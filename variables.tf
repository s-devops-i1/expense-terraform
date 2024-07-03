variable "instance_type" {}
variable "env" {}
variable "zone_id" {}
variable "vault_token" {}

#vpc
variable "default_cidr_block" {}
variable "vpc_peering_connection_id" {}
variable "default_route_table_id" {}
variable "main_cidr_block" {}
variable "default_vpc_id" {}

variable "frontend_subnets" {}
variable "backend_subnets" {}
variable "db_subnets" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "bastion_nodes" {}
variable "prometheus_nodes" {}
variable "certificate_arn" {}
variable "kms_key_id" {}
variable "min_capacity" {}
variable "max_capacity" {}
