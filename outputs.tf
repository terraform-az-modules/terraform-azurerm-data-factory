##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------
output "id" {
  description = "The ID of the "
  value       = try(azurerm_data_factory.main[0].id, null)
}

output "identity" {
  value = try(azurerm_data_factory.main[0].identity, null)
}