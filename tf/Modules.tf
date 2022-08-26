module "Azure" {
  source        = "./Azure"
  environment   = var.environment
  client_id     = var.client_id
  client_secret = var.client_secret
}