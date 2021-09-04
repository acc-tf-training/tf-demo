resource "null_resource" "azcli" {

provisioner "local-exec" {
    command = "az login --service-principal -u  ${var.service_principal} -p ${var.service_principal_key} --tenant ${var.tenant}"
  }

}