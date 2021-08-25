terraform init
terraform validate
terraform plan -out myout.tfplan
terraform apply "myout.tfplan"
terraform destroy