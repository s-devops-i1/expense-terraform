# module "frontend" {
#   depends_on = [ module.backend]
#
#   source = "./modules/app"
#   instance_type = var.instance_type
#   component  = "frontend"
#   zone_id    = var.zone_id
#   env        = var.env
#   vault_token = var.vault_token
# }
#
# module "backend" {
#   depends_on = [ module.mysql]
#
#   source = "./modules/app"
#   instance_type = var.instance_type
#   component  = "backend"
#   zone_id    = var.zone_id
#   env        = var.env
#   vault_token = var.vault_token
# }
#
# module "mysql" {
#   source = "./modules/app"
#   instance_type = var.instance_type
#   component  = "mysql"
#   zone_id    = var.zone_id
#   env        = var.env
#   vault_token = var.vault_token
# }
module "vpc" {
  source = "./modules/vpc"
  env    = var.env
}
