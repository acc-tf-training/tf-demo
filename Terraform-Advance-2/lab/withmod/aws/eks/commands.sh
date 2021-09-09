terraform init
terraform plan  -o eks.out
terraform apply eks.out
aws eks --region us-east-1 update-kubeconfig --name itawsdemoeksdev01
kubectl get pods
