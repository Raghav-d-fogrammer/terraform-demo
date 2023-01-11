terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rd-rg-sc"
    storage_account_name = "rdadls2"
    container_name       = "tfstate"
    key                  = "adf.tfstate"
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "azure_rg" {
  name     = "rd_adf_test_rg"
  location = "East US2"
}
resource "azurerm_data_factory" "azure_df" {
  name                = "rd-dev-adf-01"
  location            = "East US2"
  resource_group_name = azurerm_resource_group.azure_rg.name
}

resource "azurerm_data_factory" "azure_df_02" {
  name                = "rd-dev-adf-02"
  location            = "East US2"
  resource_group_name = azurerm_resource_group.azure_rg.name
}