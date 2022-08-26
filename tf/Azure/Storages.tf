resource "azurerm_resource_group" "rg-streamingData" {
  name     = "rg-${var.suffix}-${var.environment}"
  location = var.location
  tags     = local.volvo_tags
}

resource "azurerm_virtual_network" "Vnet" {
  name                = "virtnetname"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "SubNet" {
  name                 = "subnetname"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_storage_account" "sq-streamingData" {
  name                     = "sa${var.suffix}${var.environment}"
  resource_group_name      = azurerm_resource_group.rg-streamingData.name
  location                 = azurerm_resource_group.rg-streamingData.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
  tags                     = local.volvo_tags

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.SubNet.id]
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "fs-streamingData" {
  name               = "commonfiles-${var.environment}"
  storage_account_id = azurerm_storage_account.sq-streamingData.id
}