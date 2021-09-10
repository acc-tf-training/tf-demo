#Install Docker

# Create a Jenkins container
docker pull jenkins/jenkins:lts
docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts
docker logs jenkins
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword

# Install suggested plugins
# Create a user
# Manage jenkins
# Manage plugins
# Search for Terraform in Available and install without restart
# Back to Manage jenkins
# Global Tool Configuration
# Add Terraform
# Name: terraform
# Install automatically
# Version - latest for linux (amd64)
# Click Save

# Create a new item
# Name: infra-deployment
# Type pipeline
# Select poll SCM
# Definition: Pipeline script from SCM
# SCM: Git
# Repo URL: YOUR_REPO_URL or https://github.com/acc-tf-training/tf-jenkins.git
# Script path: networking/Jenkinsfile
# Uncheck lightweight checkout

# Go to credentials -> global
# Create a credential of type secret text with ID aws_access_key and the access key as the secret
# Create a credential of type secret text with ID aws_secret_access_key and the access secret as the secret

#Now we can run a build of the network pipeline
# First build might fail, but now the parameters will be Available

# Run a new build WITH parameters

# When build is successful create a new pipeline for the application stack

# Create a new item
# Name: app-deploy
# Type pipeline
# Select poll SCM
# Definition: Pipeline script from SCM
# SCM: Git
# Repo URL: YOUR_REPO_URL or https://github.com/acc-tf-training/tf-jenkins.git
# Script path: applications/Jenkinsfile
# Uncheck lightweight checkout

# First build might fail, but now the parameters will be Available


# Then run the build again
