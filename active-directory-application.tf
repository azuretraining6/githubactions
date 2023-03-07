module "azuread_application_01" {
  source       = "git::https://github.com/uhg-internal/azuread_application.git?ref=v0.0.1"
  display_name = "sp-${var.team}-${var.environment}-${var.project}-dbs01"
  owners       = [data.azurerm_client_config.current.object_id]
}
