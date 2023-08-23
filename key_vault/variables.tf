#############################################
# Standard variables for most rescoures
#############################################
variable "resource_group_name" {
  description = "(Required) Name of the resource group where the workload will be managed"
  type        = string
}

variable "resource_group_location" {
  type        = string
  description = <<EOT
  (Required) Location of the resource group where the workload will be managed

  Options:
  - westeurope; west europe
  - eastus; east us
  - southeastasia; south east asia
  EOT

  validation {
    condition     = can(regex("^westeurope$|^eastus$|^southeastasia$|^west europe$|^east us$|^south east asia$", var.resource_group_location))
    error_message = "Err: location is not valid."
  }
}

variable "environment" {
  type        = string
  description = <<EOT
  (Required) Describe the environment type

  Options:
  - dev
  - test
  - prod
  EOT

  validation {
    condition     = can(regex("^dev$|^test$|^prod$", var.environment))
    error_message = "Err: Valid options are dev, test, or prod."
  }
}
variable "prefix" {
  description = "(Required) Name of the workload"
  type        = string
}

#############################################
# Resource specific variables
#############################################
variable "sku_name" {
  type        = string
  description = <<EOT
  The Name of the SKU used for this Key Vault.
  
  Options:
  - Standard
  - Premium.

  EOT

  default = "Standard"
}

variable "enabled_for_deployment" {
  type        = bool
  description = <<EOT
(Optional) boolean flag to specify whether Azure Virtual Machines are permitted
to retrieve certificates stored as secrets from the key vault.

EOT

  default = false
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = <<EOT
(Optional) boolean flag to specify whether Azure Disk Encryption is permitted
to retrieve secrets from the vault and unwrap keys.

EOT

  default = false
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = <<EOT
  (Optional) boolean flag to specify whether Azure Resource Manager is permitted
  to retrieve secrets from the key vault.

  EOT

  default = false
}

variable "enable_rbac_authorization" {
  type        = bool
  description = <<EOT
  (Optional) boolean flag to specify whether Azure Key Vault uses Role Based Access
  Control (RBAC) for authorization of data actions.

  EOT

  default = false
}

variable "purge_protection_enabled" {
  type        = bool
  description = <<EOT
  (Optional) Is Purge Protection enabled for this Key Vault?

  EOT

  default = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = <<EOT
  (Optional) Whether public network access is allowed for this Key Vault.

  EOT
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = <<EOT
  (Optional) The number of days that items should be retained for once soft-deleted.
  This value can be between 7 and 90 (the default) days.

  EOT
  default     = 90
}

variable "appuser_object_id" {
  type = string
}