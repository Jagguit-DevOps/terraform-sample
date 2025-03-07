terraform {
  backend "azurerm" {
    resource_group_name   = "practice-rg"
    storage_account_name  = "storagacnt92"
    container_name        = "azurermcontainr"
    key                   = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.21.1"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

}

module "rg" {
  source   = "./modules/rg"
  rg_name  = var.rg_name
  location = var.location
}

module "vnet" {
  source   = "./modules/vnet"
  vnet_name = var.vnet_name
  rg_name   = module.rg.rg_name
  location  = module.rg.location
}
module "subnet" {
  source     = "./modules/subnet"
  subnet_name = var.subnet_name
  vnet_name  = module.vnet.vnet_name
  rg_name    = module.rg.rg_name
  address_prefixes = ["10.0.1.0/24"]
}

module "nic" {
  source   = "./modules/nic"
  nic_name = [for i in range(length(var.nic_id)) : var.nic_id[i]]
  location = module.rg.location
  rg_name  = module.rg.rg_name
  subnet_id = module.subnet.subnet_id
}

module "vm" {
  source         = "./modules/vm"
  vm_name        = [for i in range(length(var.vm_name)) : var.vm_name[i]]
  location       = module.rg.location
  rg_name        = module.rg.rg_name
  nic_id         = module.nic.nic_ids
  admin_username = var.admin_username
  admin_password = var.admin_password
}

// module "storage" {
//   source        = "./modules/storage"
//   storage_name  = var.storage_name
//   rg_name       = module.rg.rg_name
//   location      = module.rg.location
// }

// module "aks" {
//   source    = "./modules/aks"
//   aks_name  = var.aks_name
//   rg_name   = module.rg.rg_name
//   location  = module.rg.location
// }