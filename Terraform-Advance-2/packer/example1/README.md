# Introduction
Packer allows us to create templates for generating cross-platform machine images, and HashiCorp provides its own configuration language for this task. 

# Solution
Log in to the  machine

Create a directory called packer
cd packer

Create packer build file
vim ami-test.pkr.hcl

Add the example1 ami-test.pkr.hcl content to this file

Update the variables to use the access key, secret key, subnet ID, and security group

Save and exit the file

# Run the build:

packer build .
It will take several minutes for the image to generate.

To confirm it was successfully created, log in to the AWS console using the credentials

then navigate to EC2 > AMIs. You should see it listed there.



