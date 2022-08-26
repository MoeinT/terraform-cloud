resource "azurerm_databricks_workspace" "databricks-ws" {
  name                          = "db-${var.suffix}-ws-${var.environment}"
  resource_group_name           = azurerm_resource_group.rg-streamingData.name
  location                      = azurerm_resource_group.rg-streamingData.location
  managed_resource_group_name   = "db-managed-${var.suffix}-${var.environment}"
  sku                           = "premium"
  public_network_access_enabled = true
}

provider "databricks" {
  host                        = azurerm_databricks_workspace.databricks-ws.workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.databricks-ws.id
  azure_client_id             = var.client_id
  azure_client_secret         = var.client_secret
  azure_tenant_id             = data.azurerm_client_config.current.tenant_id
}

resource "databricks_cluster" "db-cluster" {
  cluster_name            = "db-${var.suffix}-${var.environment}"
  spark_version           = "11.1.x-scala2.12"
  node_type_id            = "Standard_DS3_v2"
  autotermination_minutes = 20
  autoscale {
    min_workers = 1
    max_workers = 6
  }
}