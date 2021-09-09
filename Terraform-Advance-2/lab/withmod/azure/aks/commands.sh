terraform init
terraform plan   -var-file=dev.tfvars -o aks.out
terraform apply  -var-file=dev.tfvars aks.out
az aks get-credentials --name amazamraksdev10 --resource-group amazamrrsgdev10
kubectl get pods
az aks check-acr --name amazamraksdev10 --resource-group amazamrrsgdev10 --acr NAME_OF_THE_ACR.azurecr.io
az aks update -g amazamrrsgdev10 -n amazamraksdev10 --attach-acr NAME_OF_THE_ACR
#Do the code deployment and then destroy the env
terraform destroy  -var-file=dev.tfvars -auto-approve
