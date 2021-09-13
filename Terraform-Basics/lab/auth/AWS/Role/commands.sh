aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
chmod 400 MyKeyPair.pem
aws ec2 describe-key-pairs --key-name MyKeyPair
aws ec2 describe-security-groups  [ to find the sg ]
aws ec2 describe-subnets [ to find the subnet id ] 
aws ec2 run-instances --image-id ami-029c64b3c205e6cce --count 1 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e
aws iam create-role --role-name tf_admin --assume-role-policy-document file://ec2-role-trust-policy.json
aws iam put-role-policy --role-name tf_admin --policy-name admin-access --policy-document file://ec2-role-access-policy.json
aws iam create-instance-profile --instance-profile-name tf_admin-profile
aws iam add-role-to-instance-profile --role-name tf_admin --instance-profile-name tf_admin-profile
#ssh to the newly created ec2 and install terraform
wget https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip
sudo unzip terraform_1.0.5_linux_amd64.zip -d /usr/local/bin



terraform init
terraform validate
terraform plan 
terraform apply 
terraform destroy
