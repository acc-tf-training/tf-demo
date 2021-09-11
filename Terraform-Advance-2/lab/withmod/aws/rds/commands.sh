#Before Deployment excute this command

aws ec2 create-key-pair --key-name user1 --key-type rsa --query "KeyMaterial" --output text > user1.pem
chmod 400 user1.pem

#After Deployment Adding the rule to allow 22 port and attach a elastic ip
ssh -i user1.pem ec2-user@3.219.207.121
sudo yum install telnet
telnet RDS_DNS 5432
sudo amazon-linux-extras install postgresql10
psql "postgresql://superadmin:YourPwdShouldBeLongAndSecure@RDS_DNS/demodb"
