##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------
output "id" {
  value       = try(azurerm_data_factory.main[0].id, null)
  description = "The ID of the Azure Data Factory."
}

output "identity" {
  value = try(azurerm_data_factory.main[0].identity, null)
}