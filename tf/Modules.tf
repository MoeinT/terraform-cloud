module "Azure" {
  source        = "./Azure"
  project       = var.project
  environment   = var.environment
  sp_object_id  = var.sp_object_id
  moein_obj_id  = var.moein_obj_id
  client_id     = var.client_id
  client_secret = var.client_secret
}