# terraform {
  
#   backend "azurerm" {
#     resource_group_name  = "baserg"
#     storage_account_name = "ngkteststorage001"
#     container_name       = "githubtfstate"
#     key                  = "u5owLc5mvzLKSQiQgL72Ucbvi7bM1Bo8buzWkF7NHBB3kpHi9V7zOMc9zJ2yu0V2CB9eYhsc2VvZ+ASte8szgA=="
#   }
  
  
#   required_providers {
#     databricks = {
#       source = "databricks/databricks"
#     }
#     azuread = {
#       source  = "registry.terraform.io/hashicorp/azuread"
#       #version = "~> 2.0.1"
#     }
    
#   }
# }

# provider "azurerm" {
#   # The "feature" block is required for AzureRM provider 2.x.
#   # If you're using version 1.x, the "features" block is not allowed.
#   #version = "~>2.0"
#   features {}
#   client_id       = "d6b2cd92-9903-4b15-9990-f9860144949e"
#   client_secret   = "RJJ8Q~vyUuFa2fF76tW2GIIhkTjWOADqdvaC1c3f"
#   tenant_id       = "237b86ae-2cdc-4162-9134-3ce68635da27"
#   subscription_id = "39215d40-4caf-49ad-a97f-7dab6ddfe062"

# }
# provider "random" {
  
# }

# #Create Resource Group
# resource "azurerm_resource_group" "githubactions" {
#   name     = "privatedbs21"
#   location = "eastus"
# }
 
# resource "azurerm_resource_group" "githubactions2" {
#   name     = "privatedbs212"
#   location = "eastus"
# } 