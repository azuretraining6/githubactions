resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-test"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "standard"

  tags = {
    Environment = "Production2"
  }
}
provider "databricks" {
  host = azurerm_databricks_workspace.example.workspace_url
}
resource "databricks_workspace_conf" "example" {
  custom_config = {
    "enableIpAccessLists": true
  }
}
resource "databricks_ip_access_list" "allowed-list" {
  label = "allow_in"
  list_type = "ALLOW"
  ip_addresses = [
    "1.2.3.0/24",
    "1.2.5.0/24"
  ]
  depends_on = [databricks_workspace_conf.example]
}