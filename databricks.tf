

resource "azurerm_databricks_workspace" "dbs1" {
  name                = "ngkdatabrickstest12"
  resource_group_name = azurerm_resource_group.githubactions.name
  location            = azurerm_resource_group.githubactions.location
  sku                 = "premium"

  tags = {
    Environment = "dev"
  }
}
provider "databricks" {
  azure_workspace_resource_id = azurerm_databricks_workspace.dbs1.id
}
resource "databricks_workspace_conf" "new" {
  custom_config = {
    "enableIpAccessLists": true
  }
}
resource "databricks_ip_access_list" "allowed-list" {
  label     = "allow_in"
  list_type = "ALLOW"
  ip_addresses = [
    "1.2.3.0/24",
    "1.2.5.0/24"
  ]
  depends_on = [databricks_workspace_conf.new]
}