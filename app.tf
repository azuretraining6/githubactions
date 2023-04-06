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
    app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.appinsights01.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = azurerm_application_insights.appi1.connection_string
    
  }
  site_config {}
  auth_settings_v2 {
  login {}
    auth_enabled = true
    runtime_version     = "~2"
    unauthenticated_action = "AllowAnonymous"
    
    active_directory_v2 {
      client_id = "d6b2cd92-9903-4b15-9990-f9860144949e"
      tenant_auth_endpoint = "https://login.microsoft.com/237b86ae-2cdc-4162-9134-3ce68635da27"
      client_secret_setting_name  = "MICROSOFT_PROVIDER_AUTHENTICATION_SECRET"
      }
    default_provider = "AzureActiveDirectory"

  }
}