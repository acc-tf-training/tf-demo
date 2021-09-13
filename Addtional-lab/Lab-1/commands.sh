terraform init
terraform validate
terraform plan -out lab1.tfplan
terraform apply "lab1.tfplan"
terraform destroy