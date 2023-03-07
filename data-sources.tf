data "azuread_service_principal" "databrickssp" {
  application_id = "c740cd4a-e0b8-4299-84ee-531c9477fe2b"
}
output "dbssp" {
        value = "${data.azuread_service_principal.databrickssp.id}"
}