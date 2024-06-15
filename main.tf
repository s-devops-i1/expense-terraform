module "frontend" {
  source = "./modules/app"
  instance_type = var.instance_type
  component  = "frontend"
  zone_id    = var.zone_id
  env        = var.env
}

module "backend" {
  source = "./modules/app"
  instance_type = var.instance_type
  component  = "backend"
  zone_id    = var.zone_id
  env        = var.env
}

module "mysql" {
  source = "./modules/app"
  instance_type = var.instance_type
  component  = "mysql"
  zone_id    = var.zone_id
  env        = var.env
}
