module "linuxservers" {
  source              = "github.com/acc-tf-training/tf-modules/azure/vm"
  resource_group_name = module.rsg.name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnt.subnets.0
  remote_port         = "22"
  depends_on = [module.rsg]
}

output "linux_vm_public_name" {
  value = module.linuxservers.public_ip_dns_name
}

output "linux_vm_ip_address" {
  value = module.linuxservers.public_ip_address
}

