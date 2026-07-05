# ========================================================================================================
# Module: Azure Databricks Workspace (Option B)
# Author: Andre Lima
# Description: Terraform and Provider configurations for Azure deployment validation.
# ========================================================================================================

terraform {
  required_version = ">= 1.5.0" # Ensures compatibility with modern Terraform features

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.70.0" # Minimum version required for stable Databricks workspace and connector features
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}