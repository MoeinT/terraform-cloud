#An eventhub names space for the project
resource "azurerm_eventhub_namespace" "EventHubsNamespace" {
  name                = "eventhub22${var.suffix}22${var.environment}"
  location            = azurerm_resource_group.rg-streamingData.location
  resource_group_name = azurerm_resource_group.rg-streamingData.name
  sku                 = "Basic"
  capacity            = 2
  tags                = local.volvo_tags
}

#All the Eventhubs
resource "azurerm_eventhub" "AllEventHubs" {
  for_each            = toset(["tweets${var.suffix}${var.environment}"])
  name                = each.key
  namespace_name      = azurerm_eventhub_namespace.EventHubsNamespace.name
  resource_group_name = azurerm_resource_group.rg-streamingData.name
  partition_count     = 6
  message_retention   = 1
}

/* resource "azurerm_eventhub_namespace_authorization_rule" "NameSpaceSharedAccessPolicy" {
  name                = "RootManageSharedAccessKey"
  namespace_name      = azurerm_eventhub_namespace.EventHubsNamespace.name
  resource_group_name = azurerm_resource_group.gtools-rg.name

  listen = true
  send   = true
  manage = true
} */