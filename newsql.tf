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
  administrator_login_password = random_password.password.result
  minimum_tls_version          = "1.2"
  public_network_access_enabled = true

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
  sku_name                    = "S0"
  min_capacity                = 1
  max_size_gb = 2
  auto_pause_delay_in_minutes = 60
 }

 resource "random_password" "password" {
  length           = 12
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


resource "azurerm_mssql_firewall_rule" "example" {
  name             = "FirewallRule1"
  server_id        = azurerm_mssql_server.phmsqlserver.id
  start_ip_address = "10.0.17.62"
  end_ip_address   = "10.0.17.62"
}

resource "azurerm_mssql_firewall_rule" "firewalloop" {
  name             = "${azurerm_mssql_server.phmsqlserver.name}-firewall-${count.index}"
  server_id        = azurerm_mssql_server.phmsqlserver.id
  start_ip_address = var.rules[count.index]
  end_ip_address   = var.rules[count.index]
  count = length(var.rules)
}
variable "rules" {
type = string
default = ["10.1.1.1","10.1.1.2","10.1.1.3"]
}