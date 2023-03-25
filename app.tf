resource "azurerm_service_plan" "plan1" {
  name                = "ngkauthtestwebplan01"
  resource_group_name = azurerm_resource_group.githubactions.name
  location            = azurerm_resource_group.githubactions.location
  sku_name            = "B1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp1" {
  name                = "ngkauthtestwebapp01"
  resource_group_name = azurerm_resource_group.githubactions.name
  location            = azurerm_resource_group.githubactions.location
  service_plan_id     = azurerm_service_plan.plan1.id
  identity {
    type = "ManagedServiceIdentityTypeSystemAssigned"
  }
  site_config {}
  auth_settings {
    enabled = true
    unauthenticated_client_action = "AllowAnonymous"
    active_directory {
      client_id = "8ad8b609-53d1-4fde-9cf2-c8cd01b30906"
    }
    default_provider = "BuiltInAuthenticationProviderAzureActiveDirectory"

  }
}