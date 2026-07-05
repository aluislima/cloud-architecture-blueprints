# ========================================================================================================
# Module: Azure Databricks Workspace (Option B)
# Author: Andre Lima
# Description: Output variables definitions to support CI/CD pipelines or cross-module integration.
# ========================================================================================================

output "workspace_id" {
  value       = azurerm_databricks_workspace.this.workspace_id
  description = "The unique identifier of the deployed Azure Databricks Workspace"
}

output "workspace_url" {
  value       = azurerm_databricks_workspace.this.workspace_url
  description = "The workspace URL needed for configuring the Databricks provider or accessing the UI"
}

output "access_connector_principal_id" {
  value       = azurerm_databricks_access_connector.unity_catalog.identity[0].principal_id
  description = "The Principal ID of the Access Connector's Managed Identity, used for granting storage RBAC"
}