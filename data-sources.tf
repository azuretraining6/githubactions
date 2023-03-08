data "azuread_service_principal" "databrickssp" {
  display_name = "sp-testing"
  object_id = "2000a396-24be-420f-905e-420884391b1e"
}
output "dbssp" {
        value = "${data.azuread_service_principal.databrickssp.id}"
}