variable "AzureSQLAdminName" {
  type = string
  default = "sqladmin"
}
variable "SQLServerAdminPassword" {
  type = string
  default = "Secret@123"
}
variable "location" {
  default = "eastus"
}
resource "azurerm_mssql_server" "phmsqlserver" {
  name                         = "mssql-phm01ngk-test"
  resource_group_name          = azurerm_resource_group.githubactions.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.AzureSQLAdminName
  administrator_login_password = var.SQLServerAdminPassword
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false

  azuread_administrator {
    login_username = "mpkengineer243"
    object_id      = "cc965947-26a5-4211-aca0-f4351dc72bf7"
  }

  identity {
    type = "SystemAssigned"
  }

}
resource "azurerm_mssql_database" "phmdb" {
  name                        = "mssqldb-phm01-ngk-test"
  server_id                   = azurerm_mssql_server.phmsqlserver.id
  collation                   = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                 = "Default"
  sku_name                    = "Basic"
  min_capacity                = 4
  max_size_gb                 = 250
  auto_pause_delay_in_minutes = 60
 }
