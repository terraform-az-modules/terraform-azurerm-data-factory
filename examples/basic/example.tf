provider "azurerm" {
  features {}
}

module "data-factory" {
  source = "../../"
}
