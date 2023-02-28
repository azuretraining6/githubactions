

resource "azurerm_databricks_workspace" "dbs1" {
  name                = "ngkdatabrickstest1"
  resource_group_name = azurerm_resource_group.githubactions.name
  location            = azurerm_resource_group.githubactions.location
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }
}