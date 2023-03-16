resource "azurerm_eventhub_namespace" "example" {
  name                = "ngk01EventHubNamespace"
  location            = azurerm_resource_group.githubactions.location
  resource_group_name = azurerm_resource_group.githubactions.name
  sku                 = "Standard"
  capacity            = 1

  tags = {
    environment = "Production"
  }
}

resource "azurerm_eventhub" "example" {
  name                = "ngk01TestEventHub"
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.githubactions.name
  partition_count     = 2
  message_retention   = 1
}


resource "azurerm_eventhub_authorization_rule" "example" {
  name                = "adfrule"
  namespace_name      = azurerm_eventhub_namespace.example.name
  eventhub_name       = azurerm_eventhub.example.name
  resource_group_name = azurerm_resource_group.githubactions.name
  listen              = true
  send                = false
  manage              = false
  }
 resource "azurerm_eventhub_namespace_authorization_rule" "example" {
  name                = "adfrule"
  namespace_name      = azurerm_eventhub_namespace.example.name
  resource_group_name = azurerm_resource_group.githubactions.name

  listen = true
  send   = false
  manage = false
}