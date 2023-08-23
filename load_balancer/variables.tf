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
variable "is_public" {
  description = "Boolean indicating if the load balancer is public. If set to false, it will be private."
  type        = bool
  default     = true
}

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
# Backend pool
#############################################
variable "nic_names" {
  description = "List of NIC names"
  type        = list(string)
  default     = ["nic-name-1", "nic-name-2"] # Add your NIC names here
}

#############################################
# Identifier
#############################################
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

#############################################
# Load balancing rules
#############################################
variable "enable_https_rule" {
  description = "Enable Load Balancing Rule for HTTPS (port 443)"
  type        = bool
  default     = false
}

variable "enable_http_rule" {
  description = "Enable Load Balancing Rule for HTTP (port 80)"
  type        = bool
  default     = false
}

variable "enable_https_stickiness" {
  type        = string
  default     = "Default"
  description = <<EOT
  (Optional) Specifies the load balancing distribution type to be used by the Load Balancer. 
  
  Possible values are:
  
  "Default" - The load balancer is configured to use a 5 tuple hash to map traffic to available servers.
  "SourceIP" - The load balancer is configured to use a 2 tuple hash to map traffic to available servers.
  "SourceIPProtocol" - The load balancer is configured to use a 3 tuple hash to map traffic to available servers.
  
  Also known as Session Persistence, where the options are called None, Client IP and Client IP and Protocol respectively.
  EOT
}

variable "enable_http_stickiness" {
  type        = string
  default     = "Default"
  description = <<EOT
  (Optional) Specifies the load balancing distribution type to be used by the Load Balancer. 
  
  Possible values are:
  
  "Default" - The load balancer is configured to use a 5 tuple hash to map traffic to available servers.
  "SourceIP" - The load balancer is configured to use a 2 tuple hash to map traffic to available servers.
  "SourceIPProtocol" - The load balancer is configured to use a 3 tuple hash to map traffic to available servers.
  
  Also known as Session Persistence, where the options are called None, Client IP and Client IP and Protocol respectively.
  EOT
}

variable "enable_floating_ip_https" {
  type        = bool
  default     = false
  description = <<EOT
Without Floating IP, Azure exposes a traditional load balancing IP address mapping scheme 
for ease of use (the VM instances' IP). Enabling Floating IP changes the IP address mapping
to the Frontend IP of the load balancer to allow for additional flexibility

EOT
}
variable "enable_floating_ip_http" {
  type        = bool
  default     = false
  description = <<EOT
Without Floating IP, Azure exposes a traditional load balancing IP address mapping scheme 
for ease of use (the VM instances' IP). Enabling Floating IP changes the IP address mapping
to the Frontend IP of the load balancer to allow for additional flexibility

EOT
}

variable "idle_timeout_in_minutes_https" {
  type        = string
  default     = 10
  description = "Keep a TCP or HTTP connection open without relying on clients to send keep-alive messages."
}

variable "idle_timeout_in_minutes_http" {
  type        = string
  default     = 10
  description = "Keep a TCP or HTTP connection open without relying on clients to send keep-alive messages."
}

variable "disable_outbound_snat_https" {
  type        = bool
  default     = true
  description = <<EOT
  Configures outbound SNAT for the instances in the backend pool to use the public IP address specified in the frontend.
  EOT
}

variable "disable_outbound_snat_http" {
  type        = bool
  default     = true
  description = <<EOT
  Configures outbound SNAT for the instances in the backend pool to use the public IP address specified in the frontend.
  EOT
}