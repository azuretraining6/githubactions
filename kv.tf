resource "azurerm_key_vault" "ngkvault" {
  name                        = "ngksqlpasswdkv001"
  location                    = azurerm_resource_group.githubactions.location
  resource_group_name         = azurerm_resource_group.githubactions.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"

    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "sqladminpassword" {
  name         = "sqlpasswd"
  value        =  random_password.password.result
  key_vault_id = azurerm_key_vault.ngkvault.id
}
