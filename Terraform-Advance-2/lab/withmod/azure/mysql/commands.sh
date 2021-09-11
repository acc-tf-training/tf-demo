terraform plan -var=mysql_administrator_password="Apple@123"
terraform apply -var=mysql_administrator_password="Apple@123"
mysql -u dbadmin@itazdatamsldev10.mysql.database.azure.com -h itazdatamsldev10.mysql.database.azure.com -p
