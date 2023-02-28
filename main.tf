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
  client_id       = "8ad8b609-53d1-4fde-9cf2-c8cd01b30906"
  client_secret   = "T-i8Q~efiHoDe7q.ee3PVv~C8Qb4KUXQil9g.av~"
  tenant_id       = "8c4ef0ab-8052-4567-bffb-a1e8e719eb47"
  subscription_id = "2facb92a-3b76-45a7-a8ab-fc4ba2244b28"

}

#Create Resource Group
resource "azurerm_resource_group" "githubactions" {
  name     = "privatedbs21"
  location = "eastus"
}
 