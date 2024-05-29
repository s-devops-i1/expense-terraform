module "frontend" {
  source = "./modules/app"
  instance_type = var.instance_type
  component  = "frontend"
  ssh_user       = var.ssh_user
  ssh_pass        = var.ssh_pass
  zone_id    = var.zone_id
  env        = var.env
}

module "backend" {
  source = "./modules/app"
  instance_type = var.instance_type
  component  = "backend"
  ssh_user       = var.ssh_user
  ssh_pass        = var.ssh_pass
  zone_id    = var.zone_id
  env        = var.env
}

module "mysql" {
  source = "./modules/app"
  instance_type = var.instance_type
  component  = "mysql"
  ssh_user       = var.ssh_user
  ssh_pass        = var.ssh_pass
  zone_id    = var.zone_id
  env        = var.env
}
