resource "azurerm_mssql_server" "sql" {
  name                         = "dotnet-sqlserver-${random_integer.rand.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = var.sql_password
}

resource "azurerm_mssql_database" "db" {
  name           = "sqldb1"
  server_id      = azurerm_mssql_server.sql.id
  sku_name       = "S0"
  max_size_gb    = 2
}