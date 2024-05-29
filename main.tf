module "frontend" {
  source = "./modules/app"
  instance_type = var.instance_type
  component  = "frontend"
  user       = var.user
  pwd        = var.pwd
  zone_id    = var.zone_id
  env        = var.env
}