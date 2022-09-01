resource "azurerm_service_plan" "ServicePlan" {
  name                = "test-sp-${var.environment}"
  location            = azurerm_resource_group.rg-streamingData.location
  resource_group_name = azurerm_resource_group.rg-streamingData.name
  os_type             = "Windows"
  sku_name            = "S1"
}

#azurerm_resource_group.rg-streamingData.name
resource "azurerm_windows_function_app" "TestFunctionApp" {
  name                        = "Test-funcapp-${var.environment}"
  location                    = azurerm_resource_group.rg-streamingData.location
  resource_group_name         = azurerm_resource_group.rg-streamingData.name
  service_plan_id             = azurerm_service_plan.ServicePlan.id
  storage_account_name        = azurerm_storage_account.sq-streamingData.name
  storage_account_access_key  = azurerm_storage_account.sq-streamingData.primary_access_key
  functions_extension_version = "~3"

  site_config {}
}