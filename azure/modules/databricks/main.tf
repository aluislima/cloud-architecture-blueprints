# ========================================================================================================
# Module: Azure Databricks Workspace
# Author: Andre Lima
# Description: Main infrastructure deployment code featuring VNet Injection and Secure Cluster Connectivity.
# ========================================================================================================

# --------------------------------------------------------------------------------------------------------
# DATA SOURCES
# Fetching existing networking resources to map the Databricks subnets accurately
# --------------------------------------------------------------------------------------------------------
data "azurerm_subnet" "public" {
  name                 = var.public_subnet_name
  virtual_network_name = element(split("/", var.vnet_id), length(split("/", var.vnet_id)) - 1)
  resource_group_name  = var.resource_group_name
}

data "azurerm_subnet" "private" {
  name                 = var.private_subnet_name
  virtual_network_name = element(split("/", var.vnet_id), length(split("/", var.vnet_id)) - 1)
  resource_group_name  = var.resource_group_name
}

# --------------------------------------------------------------------------------------------------------
# AZURE DATABRICKS WORKSPACE WITH VNET INJECTION
# This configures a secure enterprise Databricks workspace inside COMPANY Hub custom infrastructure
# --------------------------------------------------------------------------------------------------------
resource "azurerm_databricks_workspace" "this" {
  name                        = "dbw-zcam-latam-${var.environment}"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = "premium" # Premium SKU is required for Unity Catalog, Entra ID integration, and advanced RBAC
  managed_resource_group_name = "rg-dbw-managed-zcam-${var.environment}"

  # Custom network configuration mapping (VNet Injection)
  custom_parameters {
    no_public_ip                                         = true # Enables Secure Cluster Connectivity (SCC) to prevent public IPs on nodes
    virtual_network_id                                   = var.vnet_id
    public_subnet_name                                   = data.azurerm_subnet.public.name
    private_subnet_name                                  = data.azurerm_subnet.private.name
    public_subnet_network_security_group_association_id  = data.azurerm_subnet.public.id
    private_subnet_network_security_group_association_id = data.azurerm_subnet.private.id
  }

  tags = merge(
    var.tags,
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Author      = "Andre Lima"
      Project     = "ZCAM LATAM Data Platform"
    }
  )
}

# --------------------------------------------------------------------------------------------------------
# ACCESS CONNECTOR FOR AZURE DATABRICKS
# Required to establish secure, passwordless Managed Identity authentication to Azure Storage (Unity Catalog)
# --------------------------------------------------------------------------------------------------------
resource "azurerm_databricks_access_connector" "unity_catalog" {
  name                = "dbac-zcam-uc-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }

  tags = merge(
    var.tags,
    {
      Author = "Andre Lima"
    }
  )
}
