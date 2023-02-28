

resource "azurerm_databricks_workspace" "dbs1" {
  name                = "ngkdatabrickstest12"
  resource_group_name = azurerm_resource_group.githubactions.name
  location            = azurerm_resource_group.githubactions.location
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }
}
provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.dbs1.id
  token = "dapie8932256a3d02ac4b88d087375031c7d-3"
}
resource "databricks_workspace_conf" "new" {
  custom_config = {
    "enableIpAccessLists": true
  }
}