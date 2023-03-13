resource "azurerm_key_vault" "kv1" {
  name                       = "ngktestkv451701"
  location                   = azurerm_resource_group.githubactions.location
  resource_group_name        = azurerm_resource_group.githubactions.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

resource "azurerm_key_vault_access_policy" "kvpolicy1" {
  key_vault_id = azurerm_key_vault.kv1.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "cc965947-26a5-4211-aca0-f4351dc72bf7"


  key_permissions = [
    "Get",
  ]

  secret_permissions = [
    "Get",
  ]
}

resource "azurerm_key_vault_secret" "secret1" {
  name         = "secret-sauce"
  value        = azuread_application_password.appsecret.value
  key_vault_id = azurerm_key_vault.kv1.id
}

resource "azurerm_key_vault_secret" "clientid" {
  name         = "databricks-dev-ops-client-id"
  value        = azuread_application.appreg.application_id
  key_vault_id = azurerm_key_vault.kv1.id
}

resource "azurerm_key_vault_secret" "subid" {
  name         = "subscriptionid"
  value        = data.azurerm_client_config.current.subscription_id
  key_vault_id = azurerm_key_vault.kv1.id
}

resource "azurerm_key_vault_secret" "tenantid" {
  name         = "tenantid"
  value        = data.azurerm_client_config.current.tenant_id
  key_vault_id = azurerm_key_vault.kv1.id
}
