terraform {
  
  backend "azurerm" {
    resource_group_name  = "baserg"
    storage_account_name = "ngkteststorage001"
    container_name       = "githubtfstate"
    key                  = "u5owLc5mvzLKSQiQgL72Ucbvi7bM1Bo8buzWkF7NHBB3kpHi9V7zOMc9zJ2yu0V2CB9eYhsc2VvZ+ASte8szgA=="
  }
  
  
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
    azuread = {
      source  = "registry.terraform.io/hashicorp/azuread"
      #version = "~> 2.0.1"
    }
    
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  #version = "~>2.0"
  features {}
  client_id       = "13bb216d-a010-4966-8f7f-961fbeac91e9"
  client_secret   = "HJ18Q~7QFPlHma3MflHbNvRJJ.ZQ_XoQuYzYAb.h"
  tenant_id       = "130702be-00b7-4474-b52a-8434b7ddb71f"
  subscription_id = "a9306a86-d5dd-4693-a20e-68b9ef462144"

}
provider "random" {
  
}

#Create Resource Group
resource "azurerm_resource_group" "githubactions" {
  name     = "privatedbs21"
  location = "eastus"
}
 
resource "azurerm_resource_group" "githubactions2" {
  name     = "privatedbs212"
  location = "eastus"
} 
