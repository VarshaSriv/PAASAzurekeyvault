variable "location" {
  type    = string
  default = "westeurope"
}

variable "az_subscriptionid" {
  type        = string
  description = "Azure Subscription id"
}

variable "az_tenantid" {
  type        = string
  description = "Azure tenant id"
}

variable "az_resourcegroup" {
  type = string
}

variable "object_id" {
  type        = string
  description = "provide object id of the entity that needs access to key valut"
}

variable "key_permissions" {
  type        = list(string)
  description = "list of permissions"
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "secret_permissions" {
  type        = list(string)
  description = "list of secret permissions"
  default     = ["Get", "Set", "List"]
}

variable "application_id" {
  type        = string
  description = "Application id of Service princial that required access to key vault"
}

variable "spnobject_id" {
  type        = string
  description = "object id of Service principal"
}

variable "display_name" {
  type        = string
  description = "display name of service principal"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual network name of the subnet that requires access to key vault"
}

variable "vnet-rg" {
  type        = string
  description = "resource group that contains the virtual network"
}