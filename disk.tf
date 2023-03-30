resource "azurerm_managed_disk" "example" {
   name                = "Regulardisk"
  resource_group_name = "baserg"
  location = "eastus"
  storage_account_type = "Premium_LRS"
  create_option =     "Upload"   
  hyper_v_generation = "V2"
  on_demand_bursting_enabled = false
  os_type = "Windows"
  tags = {}
  trusted_launch_enabled = false
  upload_size_bytes = 136367309312
  timeouts {
    
  }
  }