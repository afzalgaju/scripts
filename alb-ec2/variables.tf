variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "aws-region" {
  default = "ap-south-1a"
}


variable "tag-key" {
  type    = string
  default = "new-key"
}

variable "vpc_id" {
  default = "vpc-0999904598f6cfda1"
}

variable "security_groups" {
  type    = string
  default = "sg-09cd454757b289aa4"
}

variable "subnet1" {
  default = "subnet-0c369962602394594"
}
variable "subnet2" {
  default = "subnet-05c096a071af40d1b"
}