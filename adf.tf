resource "azurerm_data_factory" "example" {
  name                = "adf-ngkadf-001"
  location            = azurerm_resource_group.githubactions.location
  resource_group_name = azurerm_resource_group.githubactions.name
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "adfngklog"
  target_resource_id = azurerm_data_factory.example.id
  eventhub_name = azurerm_eventhub.example.name

  enabled_log {
    category = "AuditEvent"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}