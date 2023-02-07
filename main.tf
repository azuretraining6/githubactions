terraform {
  backend "azurerm" {
    resource_group_name  = "githubactions"
    storage_account_name = "mpkgithubact001"
    container_name       = "tfstatedevops"
    key                  = "terraformgithubexample.tfstate"
  }
}
 
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  #version = "~>2.0"
  features {}
  subscription_id = "08394a73-8682-4082-9837-da1953841647"
  client_id       = "d7afcc7b-4c04-4863-953d-d8c82628a74d"
  client_secret   = "IQ-8Q~QBZKLjwSaZUaMptF3NvfeM9bGWt55gNcvM"
  tenant_id       = "fac4f30d-a2ea-4dda-9871-1dc986c702bd"
}
 
data "azurerm_client_config" "current" {}
 
#Create Resource Group
resource "azurerm_resource_group" "githubactions" {
  name     = "githubactions"
  location = "eastus2"
}
 
#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "githubactions-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = "eastus2"
  resource_group_name = azurerm_resource_group.githubactions.name
}
 
# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.githubactions.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "192.168.0.0/24"
}