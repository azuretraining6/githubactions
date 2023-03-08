data "azuread_service_principal" "databrickssp" {
  display_name = "sp-testing"
}