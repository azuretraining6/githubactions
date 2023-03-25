resource "azuread_application_password" "appsecret" {
  application_object_id = azuread_application.appreg.object_id
}