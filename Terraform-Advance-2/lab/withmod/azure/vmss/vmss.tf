module "vmss-cloudinit" {
  source                                 = "github.com/acc-tf-training/tf-modules/azure/vmss"
  resource_group_name                    =  module.rsg.name
  cloudconfig_file                       =  "./cloudconfig.tpl"
  location                               =  module.rsg.location
  vm_size                                = "Standard_DS2_v2"
  admin_username                         = "azureuser"
  admin_password                         = "ComplexPassword"
  ssh_key                                = "~/.ssh/id_rsa.pub"
  nb_instance                            = 2
  vm_os_simple                           = "UbuntuServer"
  vnet_subnet_id                         = module.vnt.subnets.0
  load_balancer_backend_address_pool_ids = module.loadbalancer.azurerm_lb_backend_address_pool_id
  depends_on                             = [ module.rsg ]
}
