data "azuread_application" "databrickssp" {
  display_name = "sp-testing"
}
data "azuread_service_principal" "databrickssp" {
 application_id = data.azuread_application.databrickssp.application_id
}
