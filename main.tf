provider "azurerm" {
  version = "1.38.0"
}

#create resource group
resource "azurerm_resource_group" "rg" {
    name     = "rg-storagemod1"
    location = "westus"
}

#Create Storage Account
module "storage_account" {
  source    = "./modules/storageaccount"

  saname    = "arunstorage1234"
  rgname    = azurerm_resource_group.rg.name
  location  = azurerm_resource_group.rg.location
}
