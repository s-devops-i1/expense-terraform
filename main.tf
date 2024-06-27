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
}

module "backend" {
  depends_on = [ module.mysql]

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
}

module "mysql" {
  source = "./modules/app"
  instance_type = var.instance_type
  component   = "mysql"
  zone_id     = var.zone_id
  env         = var.env
  vault_token = var.vault_token
  subnets     = module.vpc.db_subnet
  vpc_id      = module.vpc.vpc_id
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






