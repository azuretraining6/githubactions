data "azurerm_resource_group" "primary" {
    name = "privatedbs21"
}

resource "azurerm_role_definition" "rgscope" {
  name        = "readaccess-uhn"
  scope       = data.azurerm_resource_group.primary.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions     = ["Microsoft.Resources/subscriptions/resourceGroups/read"]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_resource_group.primary.id, # /subscriptions/00000000-0000-0000-0000-000000000000
  ]
}