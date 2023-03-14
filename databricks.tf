

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
  host = azurerm_databricks_workspace.dbs1.workspace_url
}
resource "databricks_service_principal" "dbs-sp" {
  application_id = azuread_application.appreg.application_id
    display_name   = azuread_application.appreg.display_name
}