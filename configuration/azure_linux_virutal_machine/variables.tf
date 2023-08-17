variable "resource_group_name" {
  type        = string
  description = <<EOT
  (Required) Name of the resource group
  EOT
}

variable "prefix" {
  type        = string
  description = <<EOT
  (Required) Name of the workload
  EOT
}

variable "location" {
  type        = string
  description = <<EOT
  (Required) Location of where the workload will exist

  Options:
  - westeurope; west europe
  - eastus; east us
  - southeastasia; south east asia
  EOT

  validation {
    condition     = can(regex("^westeurope$|^eastus$|^southeastasia$|^west europe$|^east us$|^south east asia$", var.location))
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

variable "created_by" {
  type        = string
  description = <<EOT
  (Required) Describe who created the resource
  EOT
}

variable "vnet_resource_group_name" {
  type        = string
  description = <<EOT
  (Required) Name of the resource group where the VNET is managed
  EOT
}

variable "vnet_name" {
  type        = string
  description = <<EOT
  (Required) Name of the VNET
  EOT
}

variable "subnet_name" {
  type        = string
  description = <<EOT
  (Required) Name of the subnet
  EOT
}