variable "region" {
  default = "us-east-1"
}



variable "image_id" {
  type = string
  description = "The id of the machine image (AMI) to use for the server"

validation {
   condition = length(var.image_id) > 4 && substr (var.image_id, 0, 4) == "ami-"
   error_message = "The image_id value must be a valid ami id , starting with ami- ?"
   }
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}


variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "instance_count" {
  description = "Number of instance need to create."
  type        = number
  default     = null
}
