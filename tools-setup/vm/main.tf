resource "azurerm_public_ip" "publicip" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "privateip" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = "/subscriptions/fce3d656-0949-412a-9e49-d5c96a4783c9/resourceGroups/project-setup/providers/Microsoft.Network/virtualNetworks/project-setup-network/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-attach" {
  network_interface_id      = azurerm_network_interface.privateip.id
  network_security_group_id = "/subscriptions/fce3d656-0949-412a-9e49-d5c96a4783c9/resourceGroups/project-setup/providers/Microsoft.Network/networkSecurityGroups/project-setup-allow-all"
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = var.spot ? 1 : 0
  name                  = var.name
  location              = var.rg_location
  resource_group_name   = var.rg_name
  size                  =  var.vm_size
  admin_username       = "azuser"
  admin_password       = "Devops@123456"
  network_interface_ids = [azurerm_network_interface.privateip.id]
  disable_password_authentication = false

  os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_id = "/subscriptions/fce3d656-0949-412a-9e49-d5c96a4783c9/resourceGroups/project-setup/providers/Microsoft.Compute/images/local-devops-practice"

  priority = "Spot"
  max_bid_price = -1
  eviction_policy = "Deallocate"
}

resource "azurerm_linux_virtual_machine" "nonspot" {
  count                 = var.spot ? 0 : 1
  name                  = var.name
  location              = var.rg_location
  resource_group_name   = var.rg_name
  size                  =  var.vm_size
  admin_username       = "azuser"
  admin_password       = "Devops@123456"
  network_interface_ids = [azurerm_network_interface.privateip.id]
  disable_password_authentication = false

  os_disk {
    name              = "${var.name}-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_id = "/subscriptions/fce3d656-0949-412a-9e49-d5c96a4783c9/resourceGroups/project-setup/providers/Microsoft.Compute/images/local-devops-practice"

}

resource "azurerm_dns_a_record" "publicip_dns_record" {
  depends_on          = [azurerm_public_ip.publicip]
  name                = var.name
  zone_name           = "prashumps.online"
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_public_ip.publicip.ip_address]
}

resource "azurerm_dns_a_record" "private_dns_record" {
  name                = "${var.name}-int"
  zone_name           = "prashumps.online"
  resource_group_name = var.rg_name
  ttl                 = 3
  records             = [azurerm_network_interface.privateip.private_ip_address]
}