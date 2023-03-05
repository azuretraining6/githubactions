resource "azurerm_data_factory" "example" {
  name                = "adf-ngkadf-001"
  location            = azurerm_resource_group.githubactions.location
  resource_group_name = azurerm_resource_group.githubactions.name
  identity {
    type = "SystemAssigned"
  }
}