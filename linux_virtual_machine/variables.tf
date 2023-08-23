#############################################
# Standard variables for most rescoures
#############################################
variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the resource group where the workload will be managed"
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
# Networking
#############################################
variable "subnet_name" {
  type        = string
  description = "Name of the subnet where the resource will be allocated"
}

variable "vnet_name" {
  description = "Name of the virtual network where the subnet is located"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "Name of the resource group for the virtual network"
  type        = string
}

#############################################
# Resource specific variables
#############################################
variable "create_public_ip" {
  type        = string
  description = <<EOT
  Do you want this VM to have a public IP and be on the Internet?

  Options:
  - yes
  - no
  EOT

  validation {
    condition     = can(regex("^yes$|^no$", var.create_public_ip))
    error_message = "Err: Valid options are yes or no."
  }
}

variable "create_proximity_group" {
  type        = string
  description = <<EOT
  Defines if a proximity placement group is created. If yes, then it
  is associated with an availability set.

  Options:
  - yes
  - no

  EOT

  validation {
    condition     = can(regex("^yes$|^no$", var.create_proximity_group))
    error_message = "Err: Valid options are yes or no."
  }
}

variable "node_count" {
  type        = string
  description = <<EOT
  Choose the number of VMs to create. If you creat more than 1 VM then
  an availability set will automatically be created. You have the choice
  via the 'create_proximity'group' variable to creat a proximity group
  also.

  You are limited to a max of 3 VMs.

  The default is 1.

  EOT

  default = "1"

  validation {
    condition     = can(regex("^1$|^2$|^3$", var.node_count))
    error_message = "Err: Valid options are 1,2, or 3"
  }
}

variable "workload" {
  type        = string
  description = <<EOT
  (Required) Set the workload of the VM so it can be more unique if there are
  lots of VM. Use a three letter code so names are short.
  
  Options:
  - app
  - web
  - db

  EOT

  validation {
    condition     = can(regex("^app$|^web$|^db$", var.workload))
    error_message = "Err: Valid options are app,web, or db"
  }
}

variable "vm_sku" {
  type        = string
  description = <<EOT
  (Optional) Set the size of the VM. This is limited to ensure we
  do not exceed cost budgets.
  
  Options:
  - Standard_B1s

  EOT

  default = "Standard_B1s"

  validation {
    condition     = can(regex("^Standard_B1s$", var.vm_sku))
    error_message = "Err: Valid options are Standard_B1s"
  }
}

variable "custom_data_file" {
  type        = string
  description = <<EOT
  (Optional) Define the name of the cloud-init file to be used
  as part of the custom_data resource. The file should be in the same
  folder as the Terraform code.
  
  Options:
  - cloud-init.yaml.tpl

  EOT

  default = "cloud-init.yaml.tpl"
}

variable "key_vault_name" {
  type        = string
  description = "The name of the key vault where the public keys will be written to and read from."
}

variable "key_vault_resource_group_name" {
  type        = string
  description = "The name of the key vault resource group."
}

variable "run_custom_script" {
  type        = bool
  description = "A boolean to determine whether to run a custom script or not."
  default     = false
}

variable "custom_script_path" {
  type        = string
  description = "Path to the custom script."
  default     = ""
}
