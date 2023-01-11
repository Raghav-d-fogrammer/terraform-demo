resource "azurerm_resource_group" "azure_rg" {
  name     = "rd_adf_test_rg"
  location = "East US2"
}

resource "azurerm_data_factory" "azure_df" {
  name                = "rd-dev-adf-01"
  location            = "East US2"
  resource_group_name = azurerm_resource_group.azure_rg.name
}