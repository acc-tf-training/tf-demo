module "storage" {
  source  = "github.com/acc-tf-training/tf-modules/azure/storage"
  resource_group_name  = module.rsg.name
  location             = module.rsg.location
  storage_account_name = "${var.bu_name}${var.cloud_code}${var.project_name}${var.csc_sta}${var.environment}01"
  enable_advanced_threat_protection = true
  containers_list = [
    { name = "mystore250", access_type = "private" },
    { name = "blobstore251", access_type = "blob" },
    { name = "containter252", access_type = "container" }
  ]
  file_shares = [
    { name = "smbfileshare1", quota = 50 },
    { name = "smbfileshare2", quota = 50 }
  ]
  tables = ["table1", "table2", "table3"]
  queues = ["queue1", "queue2"]
  depends_on = [ module.rsg]
}
