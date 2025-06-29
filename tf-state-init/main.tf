provider "azurerm" {
  features {}
  subscription_id = "fce3d656-0949-412a-9e49-d5c96a4783c9"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "devsecopsmps"
  resource_group_name      = "project-setup"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstates" {
  name                  = "roboshop-state-files"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}