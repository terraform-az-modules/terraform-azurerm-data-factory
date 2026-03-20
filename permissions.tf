##-----------------------------------------------------------------------------
## Permissions, Roles, and Policies
##-----------------------------------------------------------------------------
resource "azurerm_user_assigned_identity" "identity" {
  count               = var.enabled && var.cmk_encryption_enabled ? 1 : 0
  location            = var.location
  name                = var.resource_position_prefix ? format("midd-adf-%s", local.name) : format("%s-midd-adf", local.name)
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "identity_assigned" {
  depends_on           = [azurerm_user_assigned_identity.identity]
  count                = var.enabled && var.cmk_encryption_enabled ? 1 : 0
  principal_id         = azurerm_user_assigned_identity.identity[0].principal_id
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Crypto Service Encryption User"
}
