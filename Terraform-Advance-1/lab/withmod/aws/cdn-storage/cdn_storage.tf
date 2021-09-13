module "static-website-cdn" {
  source  = "github.com/acc-tf-training/tf-modules/azure/cdn-static-website"

  # Resource Group, location, and Storage account details
  create_resource_group = true
  resource_group_name   = "rg-demo-westeurope-01"
  location              = "westeurope"
  storage_account_name  = "retaccwesteupore01"

  # Static Website createion set to true by default
  # account_kind should set to StorageV2 or BlockBlobStorage
  static_website_source_folder = "data"
  index_path                   = "index.html"
  custom_404_path              = "404.html"

  # CDN endpoint for satic website
  enable_cdn_profile = true
  cdn_profile_name   = "ret-cdn-profile"
  cdn_sku_profile    = "Standard_Verizon"

  # Custom domain for CDN endpoint
  #custom_domain_name = "web.example.com"
  friendly_name      = "mywebapp"
  
  # Adding TAG's to your Azure resources (Required)
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "test-user"
  }
}
