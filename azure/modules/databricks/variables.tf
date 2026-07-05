# ========================================================================================================
# Module: Azure Databricks Workspace (Option B)
# Author: Andre Lima
# Description: Variable definitions for managing dev/prod environments with VNet Injection.
# ========================================================================================================

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., dev, prod)"
}

variable "location" {
  type        = string
  description = "The Azure region for the deployment"
  default     = "eastus2"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the existing resource group where the Databricks workspace will be deployed"
}

variable "vnet_id" {
  type        = string
  description = "The ID of the pre-existing custom virtual network for VNet Injection"
}

variable "public_subnet_name" {
  type        = string
  description = "The name of the public (container) subnet for Databricks control plane communication"
}

variable "private_subnet_name" {
  type        = string
  description = "The name of the private (host) subnet for Databricks data plane computational nodes"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources"
  default     = {}
}