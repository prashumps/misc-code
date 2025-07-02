provider "vault" {
  address = "http://vault.prashumps.online:8200"
  token = var.token
}


terraform {
  backend "azurerm" {
    use_cli              = true
    subscription_id      = "fce3d656-0949-412a-9e49-d5c96a4783c9"
    resource_group_name  = "project-setup"
    storage_account_name = "devsecopsmps"
    container_name       = "roboshop-state-files"
    key                  = "vault.terraform.tfstate"
  }
}
