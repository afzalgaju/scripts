resource "aws_vpc" "my-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}
resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.my-vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id = aws_vpc.my-vpc.id
  service_name = "com.amazonaws.us-east-1.dynamodb"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "dynamodb:*",
            "Resource": "*"
        }
    ]
}
EOF
}
