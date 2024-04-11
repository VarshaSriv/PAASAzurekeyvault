

data "azurerm_subnet" "demo-subnet" {
  name                 = "subnet-1"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.vnet-rg
}
  
resource "azurerm_key_vault" "demo-tf-kv" {
  name                          = "demo-tf-kv"
  resource_group_name           = var.az_resourcegroup
  location                      = var.location
  sku_name                      = "premium"
  tenant_id                     = var.az_tenantid
  soft_delete_retention_days    = 90
  purge_protection_enabled      = false
  public_network_access_enabled = false

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    virtual_network_subnet_ids = [data.azurerm_subnet.demo-subnet.id]
  }

}

resource "azurerm_key_vault_access_policy" "kv-ap" {
  key_vault_id       = azurerm_key_vault.demo-tf-kv.id
  tenant_id          = var.az_tenantid
  object_id          = var.object_id
  key_permissions    = var.key_permissions
  secret_permissions = var.secret_permissions
}

data "azuread_service_principal" "az_spn" {
  display_name = var.display_name
}
resource "azurerm_key_vault_access_policy" "kv-ap-spn" {
  key_vault_id       = azurerm_key_vault.demo-tf-kv.id
  tenant_id          = var.az_tenantid
  object_id          = data.azuread_service_principal.az_spn.object_id
  key_permissions    = var.key_permissions
  secret_permissions = var.secret_permissions
}



