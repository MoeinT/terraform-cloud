locals {
  volvo_tags = {
    "Assignment_Code"   = "VY07YS"
    "Business_Owner"    = "nadejda.chvikert-hivert@volvo.com"
    "Environment_Type"  = "Unmanaged"
    "ID"                = "119252"
    "InfoSeC"           = "Confidential"
    "PDS"               = "Basic"
    "Service_Level"     = "N/A"
    "Technical_Contact" = "thomas.lienard@consultant.volvo.com"
  }

  access_policy = [
    {
      tenant_id           = data.azurerm_client_config.current.tenant_id,
      object_id           = var.sp_object_id,
      secret_permissions  = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
      key_permissions     = ["Get", ]
      storage_permissions = ["Get", ]
    },
    {
      tenant_id           = data.azurerm_client_config.current.tenant_id,
      object_id           = var.moein_obj_id,
      secret_permissions  = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
      key_permissions     = ["Get", ]
      storage_permissions = ["Get", ]
    }
  ]
}