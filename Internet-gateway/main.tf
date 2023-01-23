
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc0.id

  tags = {
    Name = "main"
  }
}
resource "aws_vpc" "my-vpc0" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}