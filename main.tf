terraform {
  /*
  backend "azurerm" {
    resource_group_name  = "privatedbs"
    storage_account_name = "mpkgithubact001"
    container_name       = "tfstatedevops"
    key                  = "2w2eNcrzE/Djf+4OGo6mJ6LDCGnzrojZ3GKAzMoB1rxomGehCr3Dg5QHJMY8AF6uyeO5WNaHsy35+AStY2cDwA=="
  }
  */
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
 
#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "githubactions-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.githubactions.name
}
 
# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.githubactions.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "192.168.1.0/24"
}