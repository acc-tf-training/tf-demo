provider "aws" {
	region = "us-east-1"
}

data "aws_vpc" "main" {
	default = true
}

locals {
	name = "server"
}

variable "testing" {
	type = map
	default = {
		foo = 123
		bar = 555
	}
}


resource "aws_instance" "web" {
	count         = 2
	ami           = "ami-01f20c53ed8da4679"
	instance_type = "t2.micro"

	tags = {

    ### variable interpolation
		Name = "AWS Test ${count.index}"
	}
}


output "foo" {
	# lists out an list/array of instance ids
	#value = aws_instance.web[*].id
	#value = [for instance in aws_instance.web : instance.public_ip]
	value = [for k, v in var.testing : upper(k)]
  #value = [for k, v in var.testing : k if k == "foo"]
}

resource "aws_instance" "test" {
	ami           = "ami-01f20c53ed8da4679"
	instance_type = "t2.micro"

	tags = {
		Name = "My Test ${local.name}"
    
    ### conditional expression
		foo  = local.name == "server" ? "yes" : "no"
    
    ###HEREDOC
		bar  = <<EOT
			testing foo
		EOT
		baz  = <<-EOT
			hello from baz, no indentation with the "-"
		EOT
    data_var = "Hello, ${local.name}!"
    ###Directives
    data_if = "Hello, %{ if local.name != "" }${local.name}%{ else }unnamed%{ endif }!"
    /*
    data_loop = <<EOT
                %{ for ip in aws_instance.web.*.private_ip }
                server ${ip}
                %{ endfor }
                EOT
    */
	}
}
