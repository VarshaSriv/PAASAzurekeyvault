resource "azurerm_resource_group" "demovarsharg" {
  name     = "resource-group-demo"
  location = var.location
  tags = {
    env = "resource-group-demo"
  }
}
