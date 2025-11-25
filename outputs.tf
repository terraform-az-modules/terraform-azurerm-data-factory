##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------
output "id" {
  value = try(azurerm_data_factory.main[0].id, null)
}

output "identity" {
  description = "The ID of the entity"
  value       = try(azurerm_data_factory.main[0].identity, null)
}