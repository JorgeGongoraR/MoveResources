# Configuration
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }
}

# Variables
variable "region" {
  type        = string
  description = "Region in Azure"
  default     = "eastus"
}

variable "firstVariable" {
  type        = string
  description = "prefix for naming"
  default     = "firstVariable"
}

variable "secondVariable" {
  type        = string
  description = "prefix for naming"
  default     = "secondVariable"
}

# Providers
provider "azurerm" {
  features {}
}

# Data sources
locals {
  firstVariable = "${var.firstVariable}-demo"
  secondVariable = "${var.secondVariable}-demo"
}

# Resources
resource "azurerm_resource_group" "myfirstrg" {
  name     = local.firstVariable
  location = var.region
}

resource "azurerm_resource_group" "mysecondrg" {
  name     = local.secondVariable
  location = var.region
}
