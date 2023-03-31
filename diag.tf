# resource "azurerm_monitor_diagnostic_setting" "example" {
#   name               = "example"
#   target_resource_id = azurerm_managed_disk.example.id
#   eventhub_name = azurerm_eventhub.example.name
#   eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.disk.id

#   enabled_log {
#     category = "AuditEvent"

#     retention_policy {
#       enabled = false
#     }
#   }

#   metric {
#     category = "AllMetrics"

#     retention_policy {
#       enabled = false
#     }
#   }
# }
resource "azurerm_monitor_log_profile" "example" {
  name = "ngklogprofile"

  categories = [
    "Action",
    "Delete",
    "Write",
  ]

  locations = [
    "eastus",
    "global",
  ]

  # RootManageSharedAccessKey is created by default with listen, send, manage permissions
  servicebus_rule_id = "${azurerm_eventhub_namespace.example.id}/authorizationrules/RootManageSharedAccessKey"
  

  retention_policy {
    enabled = true
    days    = 7
  }
}

# resource "azurerm_monitor_diagnostic_setting" "example" {
#     name                           = "example"
#     target_resource_id             = "/subscriptions/39215d40-4caf-49ad-a97f-7dab6ddfe062/resourceGroups/Infracode/providers/Microsoft.KeyVault/vaults/ngknewkvforpltest01"

#     eventhub_name = azurerm_eventhub.example.name
#     eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.example.id

#     enabled_log {
#         category = "Administrative"

#         retention_policy {
#         enabled = false
#     }
# }
# }