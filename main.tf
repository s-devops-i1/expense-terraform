module "frontend" {
  depends_on = [ module.backend]

  source = "./modules/app"
  instance_type = var.instance_type
  component  = "frontend"
  zone_id    = var.zone_id
  env        = var.env
  vault_token = var.vault_token
  subnets     = module.vpc.frontend_subnet
  vpc_id      = module.vpc.vpc_id
  lb_type     = "public"
  lb_needed   = true
  lb_subnets  = module.vpc.public_subnets
  app_port    = 80
  bastion_nodes = var.bastion_nodes
  prometheus_nodes = var.prometheus_nodes
  server_app_port_sg_cidr = var.public_subnets
  lb_app_port_sg_cidr     = ["0.0.0.0/0"]
  certificate_arn         = var.certificate_arn
  lb_ports                = {http: 80, https: 443}
}

module "backend" {
  depends_on = [ module.rds]

  source = "./modules/app"
  instance_type = var.instance_type
  component  = "backend"
  zone_id    = var.zone_id
  env        = var.env
  vault_token = var.vault_token
  subnets     = module.vpc.backend_subnet
  vpc_id      = module.vpc.vpc_id
  lb_type     = "private"
  lb_needed   = true
  lb_subnets  = module.vpc.backend_subnet
  app_port    = 8080
  bastion_nodes = var.bastion_nodes
  prometheus_nodes = var.prometheus_nodes
  server_app_port_sg_cidr = concat(var.frontend_subnets, var.backend_subnets)
  lb_app_port_sg_cidr     = var.frontend_subnets
  lb_ports                = {http: 8080}
}

module "rds" {
  source = "./modules/rds"

  allocated_storage      = 20
  component              = "rds"
  engine                 = "mysql"
  engine_version         = "8.0.36"
  env                    = var.env
  family                 = "mysql8.0"
  instance_class         = "db.t3.micro"
  server_app_port_sg_cidr= var.backend_subnets
  storage_type           = "gp3"
  subnet_ids             = module.vpc.db_subnet
  vpc_id                 = module.vpc.vpc_id
  skip_final_snapshot    = true
}


module "vpc" {
  source                     = "./modules/vpc"
  env                        = var.env
  default_cidr_block         = var.default_cidr_block
  vpc_peering_connection_id  = var.vpc_peering_connection_id
  default_route_table_id     = var.default_route_table_id
  main_cidr_block            = var.main_cidr_block
  default_vpc_id             = var.default_vpc_id
 frontend_subnets            = var.frontend_subnets
 backend_subnets             = var.backend_subnets
 db_subnets                  = var.db_subnets
 public_subnets              = var.public_subnets
 availability_zones          = var.availability_zones
}






