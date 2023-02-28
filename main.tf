terraform {
  
  backend "azurerm" {
    resource_group_name  = "baserg"
    storage_account_name = "mpktfstate001"
    container_name       = "tfstate"
    key                  = "07RM4OwVhorc4Fyczj84t49b5JxXhK4aXis4YaFJ+CA7qS3yTAHoMZE/KtuFCPU0dqtvEKMXrkXo+AStTH+23g=="
  }
  
  
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  #version = "~>2.0"
  features {}
}

#Create Resource Group
resource "azurerm_resource_group" "githubactions" {
  name     = "privatedbs21"
  location = "eastus"
}
 