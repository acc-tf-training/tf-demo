
#######################################################
#          Create Network security Rule               #
#######################################################


#Create NSG Rule

module "nsg00" {
  source                = "github.com/acc-tf-training/tf-modules/azure/nsg"
  resource_group_name   = module.rsg.name
  location              = module.rsg.location
  security_group_name   =  var.nsg_name[0]
  predefined_rules = [
    {
      name     = "HTTP"
      priority = "500"
    },
    {
      name              = "HTTPS"
      priority          = "501"
    }
  ]
  custom_rules = [
    {
      name                   = "metrics"
      priority               = "550"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      destination_port_range = "18080"
      description            = "description-metrics"
    }
  ]
  tags                   = module.ctag.tags
}

module "nsg01" {
  source                = "github.com/acc-tf-training/tf-modules/azure/nsg"
  resource_group_name   = module.rsg.name
  location              = module.rsg.location
  security_group_name   =  var.nsg_name[1]
  tags                   = module.ctag.tags
}
