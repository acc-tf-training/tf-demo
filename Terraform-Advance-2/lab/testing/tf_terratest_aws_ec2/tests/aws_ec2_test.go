package test

import (
        "fmt"
        "testing"
        "time"

        http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
        "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAzureResourceGroupExample(t *testing.T) {
        t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",
	})

        // At the end of the test, run `terraform destroy` to clean up any resources that were created
        defer terraform.Destroy(t, terraformOptions)

        // Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
        terraform.InitAndApply(t, terraformOptions)

       // Run `terraform output` to get the IP of the instance
	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	// Make an HTTP request to the instance and make sure we get back a 200 OK with the body "Hello, World!"
	url := fmt.Sprintf("http://%s", publicIp)
	http_helper.HttpGetWithRetry(t, url, nil, 200,"<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>", 30, 5*time.Second)
}
