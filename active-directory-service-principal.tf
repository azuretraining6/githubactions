resource "azuread_service_principal" "sp1" {
  application_id               = azuread_application.appreg.application_id
  app_role_assignment_required = false
  
}