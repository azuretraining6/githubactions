data "azuread_service_principal" "databrickssp" {
  display_name = "sp-testing"
}
output "dbssp" {
        value = "${data.azuread_service_principal.databrickssp.id}"
}