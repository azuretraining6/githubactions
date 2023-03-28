resource "azurerm_service_plan" "plan1" {
  name                = "ngkauthtestwebplan02"
  resource_group_name = azurerm_resource_group.githubactions.name
  location            = azurerm_resource_group.githubactions.location
  sku_name            = "B1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp1" {
  name                = "ngkauthtestwebapp02"
  resource_group_name = azurerm_resource_group.githubactions.name
  location            = azurerm_resource_group.githubactions.location
  service_plan_id     = azurerm_service_plan.plan1.id
  identity {
    type = "SystemAssigned"
  }
  site_config {}
  auth_settings_v2 {
    auth_enabled = true
    runtime_version     = "~2"
    unauthenticated_action = "AllowAnonymous"
    active_directory_v2 {
      client_id = "8ad8b609-53d1-4fde-9cf2-c8cd01b30906"
      tenant_auth_endpoint = "https://login.microsoft.com/237b86ae-2cdc-4162-9134-3ce68635da27/v2.0"
    }
    default_provider = "AzureActiveDirectory"

  }
}