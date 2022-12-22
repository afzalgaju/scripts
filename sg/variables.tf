variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-074dc0a6f6c764218"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "aws-region" {
  default = "ap-south-1a"
}

variable "tag-key" {
  default = "new-key"
}

variable "vpc_id" {
  type = string
  default = "vpc-0999904598f6cfda1"
}

variable "aws_security_group" {
  type    = string
  default = "sg-09cd454757b289aa4"

}