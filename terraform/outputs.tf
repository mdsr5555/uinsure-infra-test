########################################################
# GENERAL
########################################################

output "resource_group_name" {
  description = "Resource Group name"
  value       = azurerm_resource_group.rg.name
}

output "location" {
  description = "Azure region"
  value       = azurerm_resource_group.rg.location
}

########################################################
# NETWORKING / VM
########################################################

output "vm_public_ip" {
  description = "Public IP address of Windows Server VM"
  value       = azurerm_public_ip.vm_ip.ip_address
}

output "vm_rdp_command" {
  description = "Command to RDP into the VM"
  value       = "mstsc /v:${azurerm_public_ip.vm_ip.ip_address}"
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.vm.name
}

########################################################
# APP SERVICE
########################################################

output "app_service_name" {
  description = "Azure Web App name"
  value       = azurerm_windows_web_app.app.name
}

output "app_service_url" {
  description = "Public URL of Web App"
  value       = "https://${azurerm_windows_web_app.app.default_hostname}"
}

output "app_service_plan" {
  value = azurerm_service_plan.plan.name
}

########################################################
# SQL SERVER / DATABASE
########################################################

output "sql_server_name" {
  value = azurerm_mssql_server.sql.name
}

output "sql_server_fqdn" {
  description = "SQL Server fully qualified domain name"
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "sql_database_name" {
  value = azurerm_mssql_database.db.name
}

########################################################
# CONNECTION STRINGS (SENSITIVE)
########################################################

output "sql_connection_string" {
  description = "Connection string for application usage"
  sensitive   = true

  value = "Server=tcp:${azurerm_mssql_server.sql.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=sqladmin;Password=${var.sql_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}

########################################################
# QUICK LINKS AFTER DEPLOYMENT
########################################################

output "portal_resource_group_link" {
  value = "https://portal.azure.com/#@/resource/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${azurerm_resource_group.rg.name}/overview"
}
