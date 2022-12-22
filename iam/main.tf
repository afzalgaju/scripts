
resource "aws_iam_user" "mahira1" {
  name = "mahira1"
}

resource "aws_iam_role" "iam-role" {
  name = "iam-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_group" "mahira2" {
  name = "mahira2"
}

resource "aws_iam_policy" "mypolicy" {
  name        = "mypolicy"
  description = "policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "mypolicy" {
  name       = "policy-attachment"
  users      = [aws_iam_user.mahira1.name]
  roles      = [aws_iam_role.iam-role.name]
  groups     = [aws_iam_group.mahira2.name]
  policy_arn = aws_iam_policy.mypolicy.arn
}

