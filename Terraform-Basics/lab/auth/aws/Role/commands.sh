aws iam create-role --role-name tf_admin --assume-role-policy-document file://ec2-role-trust-policy.json
aws iam put-role-policy --role-name tf_admin --policy-name admin-access --policy-document file://ec2-role-access-policy.json
aws iam create-instance-profile --instance-profile-name tf_admin-profile

#attach the created tf_admin role to the instance which has terraform running 



terraform init
terraform validate
terraform plan 
terraform apply 
terraform destroy
