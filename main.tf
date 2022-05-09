# Configure Terraform itself:
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
          # The above is supposedly shorthand for:
          # registry.terraform.io/hashicorp/azurerm
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

# Configure azure provider plugin (this one is empty for now):
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "eastus2"
  tags = {
    Environment = "Terraform Getting Started"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
    name = "myTFVnet"
    address_space = ["10.0.0.0/16"]
        # Indicates the address range:
        # 10.0.0.0 - 10.0.255.255
        # The first and last address are for base and broadcast though.
    location      = "eastus2"
    resource_group_name = azurerm_resource_group.rg.name
}

