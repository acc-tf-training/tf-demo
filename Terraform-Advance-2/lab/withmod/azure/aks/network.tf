#######################################################
#          Create the Network and Subnet              #
#######################################################




module "vnt" {
  source              = "github.com/acc-tf-training/tf-modules/azure/vnt"
  name                = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_vnt}${var.environment}10"
  resource_group_name = module.rsg.name
  location            = module.rsg.location
  address_space       = var.vnt_address_space
  subnet_prefixes     = var.vnt_snt_address_spaces
  subnet_names        = var.subnet_names
  subnet_service_endpoints = {
    "${var.subnet_names[0]}" = ["Microsoft.Storage","Microsoft.Sql","Microsoft.AzureActiveDirectory","Microsoft.ContainerRegistry","Microsoft.KeyVault"]
    "${var.subnet_names[1]}" = ["Microsoft.Storage","Microsoft.Sql","Microsoft.AzureActiveDirectory","Microsoft.ContainerRegistry","Microsoft.KeyVault"]
  }
#  dns_servers         = var.dns_servers
  nsg_ids = {
    "${var.subnet_names[0]}" = module.nsg00.id
    "${var.subnet_names[1]}" = module.nsg01.id
  }
  tags = module.ctag.tags
}
