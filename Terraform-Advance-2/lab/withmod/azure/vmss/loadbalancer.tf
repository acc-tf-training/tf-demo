module "loadbalancer" {
  source              = "github.com/acc-tf-training/tf-modules/azure/loadbalancer"
  resource_group_name =  module.rsg.name
  location            =  module.rsg.location
  prefix              =  "myloadbalancer"
 /*
  remote_port = {
    ssh = ["Tcp", "22"]
  }

  lb_port = {
    http = ["80", "Tcp", "80"]
  }
  */
  depends_on = [ module.rsg ]
}
