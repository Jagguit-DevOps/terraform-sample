variable "location" {}
variable "rg_name" {}
variable "vnet_name" {}
variable "subnet_name" {}
#variable "storage_name" {}
#variable "aks_name" {}

variable "vm_name" {
  type = list(string)
}
variable "admin_username" {}
variable "admin_password" {}

variable "nic_name" {
  type = list(string)
}
variable "nic_id" {
  type = list(string)
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
  sensitive = true  # Hides it from logs
}

variable "tenant_id" {
  type = string
}