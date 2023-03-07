# data "azuread_service_principal" "databrickssp" {
#   application_id = "ba318204-22a1-407c-87a0-15b1adcc4a96"
# }
# output "dbssp" {
#         value = "${data.azurerm_azuread_service_principal.databrickssp.id}"
# }