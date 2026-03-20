##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------
output "data_factory_id" {
  description = "The ID of the deployed Azure Data Factory."
  value       = module.data_factory.id
}

output "data_factory_identity" {
  description = "The managed identity block of the Azure Data Factory."
  value       = module.data_factory.identity
}
