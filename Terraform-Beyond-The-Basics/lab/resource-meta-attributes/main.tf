#Provider Example
#####################

provider "aws" {
	region = "us-west-2"
}

provider "aws" {
	alias  = "east"
	region = "us-east-1"
}

variable "image_id" {
  type = string
  description = "The id of the machine image (AMI) to use for the server"
  default = "ami-01f20c53ed8da4679"
  validation {
   condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
   #condition     = can(regex("^ami-", var.image_id))
   error_message = "The image_id value must be a valid ami id , starting with ami- ?"
   }
 }
#Depends Example
################
resource "aws_instance" "web-east" {
  provider      =  aws.east
  ami           = var.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "My Instance Test in Us East"
  }
}

resource "aws_instance" "web-west" {
  ami           = "ami-003634241a8fcdec0"
  instance_type = "t2.micro"

  tags = {
    Name = "My Instance Test in Us West"
  }
  depends_on = [aws_instance.web-east]
}


#Count Example
################
/*
resource "aws_instance" "web" {
	count         = 2
	ami           = "ami-003634241a8fcdec0"
	instance_type = "t2.micro"

	tags = {
		Name = "My Instance Test ${count.index}"
	}
}

#output "instance" {
#   value = aws_instance.web[0].public_ip
#
#}

###Splat Expressions 
###

#output "instance" {
#   value = aws_instance.web[*].public_ip
#
#}

output "instance" {
	# lists out an list/array of instance ids
	#value = aws_instance.web[*].id
	value = [for instance in aws_instance.web : instance.public_ip]
}
*/


#For Each Example
#################
/*
resource "aws_instance" "web" {
	for_each = {
		size1 = "t2.micro"
		size2 = "t2.large"
	}

	ami           = "ami-003634241a8fcdec0"
	instance_type = each.value

	tags = {
		Name = each.key
	}
}
output "instance" {
  #value = aws_instance.web["prod"].public_ip
  value = [for instance in aws_instance.web : instance.public_ip]
}
*/

# LifeCycle Example 
#####################
resource "aws_instance" "web" {
	provider      = aws.east
	ami           = "ami-085925f297f89fce1"
	instance_type = "t2.micro"

	tags = {
		Name = "My Instance in the east"
	}

	lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
		ignore_changes        = [tags]
	}
}
