## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cmk\_encryption\_enabled | Enable Customer Managed Key encryption. | `bool` | `true` | no |
| custom\_name | Override default naming convention | `string` | `null` | no |
| deployment\_mode | Specifies how the infrastructure/resource is deployed | `string` | `"terraform"` | no |
| enable\_private\_endpoint | Enable private endpoint for Data Factory. | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | n/a | yes |
| extra\_tags | Variable to pass extra tags. | `map(string)` | `null` | no |
| github\_configuration | GitHub integration configuration. | <pre>object({<br>    account_name    = string<br>    branch_name     = string<br>    git_url         = string<br>    repository_name = string<br>    root_folder     = string<br>  })</pre> | `null` | no |
| global\_parameters | List of global parameters for Data Factory. | <pre>list(object({<br>    name  = string<br>    type  = string<br>    value = string<br>  }))</pre> | `null` | no |
| identity\_type | Type of Managed Service Identity. Options: SystemAssigned, UserAssigned, or both. | `string` | `"UserAssigned"` | no |
| key\_expiration\_date | The expiration date for the Key Vault key | `string` | `"2028-12-31T23:59:59Z"` | no |
| key\_permissions | List of key permissions for the Key Vault key. | `list(string)` | <pre>[<br>  "decrypt",<br>  "encrypt",<br>  "sign",<br>  "unwrapKey",<br>  "verify",<br>  "wrapKey"<br>]</pre> | no |
| key\_size | The size of the RSA key in bits. | `number` | `2048` | no |
| key\_type | The type of the key to create in Key Vault. | `string` | `"RSA-HSM"` | no |
| key\_vault\_id | Key Vault ID for encryption keys. | `string` | `null` | no |
| label\_order | The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']. | `list(any)` | <pre>[<br>  "name",<br>  "environment",<br>  "location"<br>]</pre> | no |
| location | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| managed\_virtual\_network\_enabled | Enable managed virtual network for Data Factory. | `bool` | `null` | no |
| managedby | ManagedBy, eg 'terraform-az-modules'. | `string` | `"terraform-az-modules"` | no |
| manual\_connection | Indicates whether the connection is manual | `bool` | `false` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | n/a | yes |
| private\_dns\_zone\_ids | The ID of the private DNS zone. | `string` | `null` | no |
| public\_network\_enabled | Enable public network access for Data Factory. | `bool` | `false` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/terraform-az-modules/terraform-azure-data-factory"` | no |
| resource\_group\_name | The name of the resource group in which to create the network security group. | `string` | n/a | yes |
| resource\_position\_prefix | Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.<br><br>- If true, the keyword is prepended: "vnet-core-dev".<br>- If false, the keyword is appended: "core-dev-vnet".<br><br>This helps maintain naming consistency based on organizational preferences. | `bool` | `true` | no |
| subnet\_id | Subnet ID for the private endpoint. | `string` | `null` | no |
| vsts\_configuration | Azure DevOps (VSTS) integration configuration. | <pre>object({<br>    account_name    = string<br>    branch_name     = string<br>    project_name    = string<br>    repository_name = string<br>    root_folder     = string<br>    tenant_id       = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | #----------------------------------------------------------------------------- # Outputs #----------------------------------------------------------------------------- |
| identity | n/a |

