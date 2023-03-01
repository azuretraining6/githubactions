data "azurerm_resource_group" "primary" {
    name = "privatedbs21"
}
data "azurerm_client_config" "example" {
}
resource "azurerm_role_definition" "rgscope" {
  name        = "readaccess-uhn"
  scope       = data.azurerm_resource_group.primary.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions     = ["Microsoft.Resources/subscriptions/resourceGroups/read",
                "Microsoft.Resources/subscriptions/resourcegroups/resources/read"
                  ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_resource_group.primary.id, # /subscriptions/00000000-0000-0000-0000-000000000000
    azurerm_resource_group.githubactions2.id,
  ]
}
resource "azurerm_role_assignment" "example" {
  name               = "uncteamassign"
  scope              = azurerm_resource_group.githubactions2.id
  role_definition_id = azurerm_role_definition.rgscope.role_definition_resource_id
  principal_id       = data.azurerm_client_config.example.object_id
}