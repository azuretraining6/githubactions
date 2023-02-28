terraform {
  /*
  backend "azurerm" {
    resource_group_name  = "privatedbs"
    storage_account_name = "mpkgithubact001"
    container_name       = "tfstatedevops"
    key                  = "2w2eNcrzE/Djf+4OGo6mJ6LDCGnzrojZ3GKAzMoB1rxomGehCr3Dg5QHJMY8AF6uyeO5WNaHsy35+AStY2cDwA=="
  }
  */
  
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
  name     = "privatedbs2"
  location = "eastus"
}
 