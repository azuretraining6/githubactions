resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "example"
  target_resource_id = data.azurerm_network_interface.vmnic.id
  eventhub_name = azurerm_eventhub.example.name
  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.disk.id

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
