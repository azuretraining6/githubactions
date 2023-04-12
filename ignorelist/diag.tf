resource "azurerm_monitor_diagnostic_setting" "niccarddiag" {
  name               = "niccarddiagsetting"
  target_resource_id = data.azurerm_network_interface.vmnic.id
  eventhub_name = azurerm_eventhub.example.name
  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.disk.id

  
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
