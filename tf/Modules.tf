module "Azure" {
  source        = "./Azure"
  environment   = var.environment
  client_id     = var.client_id
  client_secret = var.client_secret
  sp_object_id  = var.sp_object_id
  moein_obj_id  = var.moein_obj_id
}