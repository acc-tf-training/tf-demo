##############################################################################################
# Creating the Azure AD App                                                                  #
##############################################################################################

module "aad_app" {
  source = "github.com/acc-tf-training/tf-modules/azuread/add_app"
  name = "myapp"
  reply_urls = ["https://myapp"]
  password                = "myapppassword"
  api_permissions = [
    {
      name = "Microsoft Graph"
      oauth2_permissions = [
	    "email",
		  "Group.Read.All",
		  "GroupMember.Read.All",
		  "openid",
		  "profile",
		  "User.Read"
      ]
      app_roles = [
        "Directory.Read.All"
      ]
    }
  ]
}
