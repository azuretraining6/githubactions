data "azuread_service_principal" "databrickssp" {
  display_name = "sp-testing"
}
data "azuread_application" "databrickssp" {
  display_name = "sp-testing"
}