terraform {
  cloud {
    organization = "TerraformActionsMoein"

    workspaces {
      tags = ["terraformcloud"]
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }

    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "databricks" {
}

data "azurerm_client_config" "current" {}