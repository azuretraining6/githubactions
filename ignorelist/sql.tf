resource "random_password" "sqlpasswd" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "sql1" {
  name                         = "ngk41sqlserver"
  resource_group_name          = azurerm_resource_group.githubactions.name
  location                     = azurerm_resource_group.githubactions.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = random_password.sqlpasswd.result
  public_network_access_enabled = true
}
output "sqlpassed" {
    value = random_password.sqlpasswd.result
    sensitive = true
}

resource "azurerm_mssql_database" "sqldb" {
  name           = "ngktestdb"
  server_id      = azurerm_mssql_server.sql1.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false

  tags = {
    foo = "bar"
  }
 }
# resource "azurerm_mssql_firewall_rule" "firewall1" {
#   for_each = var.ip_list
#   name             = "FirewallRule1"
#   server_id        = azurerm_mssql_server.sql1.id
#   start_ip_address = var.ip_list
#   end_ip_address   = var.ip_list
# }
# variable "ip_list" {
#   default = ["10.100.10.1","10.100.10.2"]
# }