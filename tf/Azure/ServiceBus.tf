resource "azurerm_servicebus_namespace" "EventGridServiceBus" {
  name                = "sv-${var.suffix}-${var.environment}"
  location            = azurerm_resource_group.rg-streamingData.location
  resource_group_name = azurerm_resource_group.rg-streamingData.name
  sku                 = "Basic"
  tags                = local.volvo_tags
}

#An authorization rule at the ServiceBus level
/* resource "azurerm_servicebus_namespace_authorization_rule" "ServiceBusAuthorizationRule" {
  name         = "RootManageSharedAccessKey"
  namespace_id = azurerm_servicebus_namespace.EventGridServiceBus.id

  listen = true
  send   = true
  manage = true
} */