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
  resource_group_name          = data.azurerm_resource_group.githubactions.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.SQLServerAdminLogin
  administrator_login_password = var.SQLServerAdminPassword
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false

  azuread_administrator {
    login_username = var.AzureSQLAdminName
    object_id      = var.AzureSQLAdminId
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
  sku_name                    = "GP_S_Gen5_8"
  min_capacity                = 4
  max_size_gb                 = 250
  auto_pause_delay_in_minutes = 60
 }
