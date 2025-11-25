##-----------------------------------------------------------------------------
# Standard Tagging Module – Applies standard tags to all resources for traceability
##-----------------------------------------------------------------------------
module "labels" {
  source          = "terraform-az-modules/tags/azurerm"
  version         = "1.0.2"
  name            = var.custom_name == null ? var.name : var.custom_name
  location        = var.location
  environment     = var.environment
  managedby       = var.managedby
  label_order     = var.label_order
  repository      = var.repository
  deployment_mode = var.deployment_mode
  extra_tags      = var.extra_tags
}

resource "azurerm_data_factory" "main" {
  count                            = var.enabled ? 1 : 0
  name                             = var.resource_position_prefix ? format("adf-%s", local.name) : format("%s-adf", local.name)
  location                         = var.location
  resource_group_name              = var.resource_group_name
  public_network_enabled           = var.public_network_enabled
  managed_virtual_network_enabled  = var.managed_virtual_network_enabled
  tags                             = module.labels.tags
  customer_managed_key_id          = var.cmk_encryption_enabled ? azurerm_key_vault_key.main[0].id : null
  customer_managed_key_identity_id = var.cmk_encryption_enabled ? azurerm_user_assigned_identity.identity[0].id : null
  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" ? azurerm_user_assigned_identity.identity[*].id : null
    }
  }

  dynamic "github_configuration" {
    for_each = var.github_configuration != null ? [1] : []
    content {
      account_name    = var.github_configuration.account_name
      branch_name     = var.github_configuration.branch_name
      git_url         = var.github_configuration.git_url
      repository_name = var.github_configuration.repository_name
      root_folder     = var.github_configuration.root_folder
    }
  }
  dynamic "vsts_configuration" {
    for_each = var.vsts_configuration != null ? [1] : []
    content {
      account_name    = var.vsts_configuration.account_name
      branch_name     = var.vsts_configuration.branch_name
      project_name    = var.vsts_configuration.project_name
      repository_name = var.vsts_configuration.repository_name
      root_folder     = var.vsts_configuration.root_folder
      tenant_id       = var.vsts_configuration.tenant_id
    }
  }
  dynamic "global_parameter" {
    for_each = var.global_parameters != null ? var.global_parameters : []
    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }
  depends_on = [azurerm_key_vault_key.main]
}

resource "azurerm_key_vault_key" "main" {
  depends_on      = [azurerm_role_assignment.identity_assigned]
  count           = var.enabled && var.cmk_encryption_enabled ? 1 : 0
  name            = var.resource_position_prefix ? format("cmk-key-adf-%s", local.name) : format("%s-cmk-key-adf", local.name)
  key_vault_id    = var.key_vault_id
  key_type        = var.key_type
  key_size        = var.key_size
  expiration_date = var.key_expiration_date
  key_opts        = var.key_permissions
}

resource "azurerm_private_endpoint" "main" {
  count                         = var.enabled && var.enable_private_endpoint ? 1 : 0
  name                          = var.resource_position_prefix ? format("pe-adf-%s", local.name) : format("%s-pe-adf", local.name)
  location                      = var.location
  resource_group_name           = var.resource_group_name
  subnet_id                     = var.subnet_id
  custom_network_interface_name = var.resource_position_prefix ? format("pe-nic-adf-%s", local.name) : format("%s-pe-nic-adf", local.name)
  private_dns_zone_group {
    name                 = var.resource_position_prefix ? format("dns-zone-group-adf-%s", local.name) : format("%s-dns-zone-group-adf", local.name)
    private_dns_zone_ids = [var.private_dns_zone_ids]
  }
  private_service_connection {
    name                           = var.resource_position_prefix ? format("psc-adf-%s", local.name) : format("%s-psc-adf", local.name)
    is_manual_connection           = var.manual_connection
    private_connection_resource_id = azurerm_data_factory.main[0].id
    subresource_names              = ["dataFactory"]
  }
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_data_factory_linked_service_key_vault" "main" {
  count           = var.enabled && var.cmk_encryption_enabled ? 1 : 0
  name            = var.resource_position_prefix ? format("kv-adf-%s", local.name) : format("%s-kv-adf", local.name)
  data_factory_id = azurerm_data_factory.main[0].id
  key_vault_id    = var.key_vault_id
}