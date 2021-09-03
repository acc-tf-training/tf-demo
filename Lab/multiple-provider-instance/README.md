
Clone Over Code for Terraform Providers
  1. Create a providers directory.
  2. Switch into the providers directory.
  3. Create a main.tf file using the code provided in the lab's GitHub repo.

Deploy the Code with Terraform Apply
   1. Enable verbose output logging for Terraform commands using the TF_LOG=TRACE command.
   2. Initialize the working directory where the code is located.
   3. Review the actions that will be performed when you deploy the code using the terraform plan command.
   4. Deploy the code with the terraform apply command.
   5. Verify that your resources were created and that the providers are working as intended.
   6. Tear down the infrastructure using the terraform destroy --auto-approve command.