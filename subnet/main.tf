resource "aws_vpc" "my-vpc1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.my-vpc1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my-subnet"
  }
}