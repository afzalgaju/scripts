resource "aws_iam_policy" "ssm_policy" {
  name   = "ssm_policy"
  policy = var.iam_policy
}
#create iam_role
resource "aws_iam_role" "ssm_role" {
  name = "ssm_role"

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

resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = aws_iam_policy.ssm_policy.arn
}
resource "aws_instance" "ec2_instance" {
  ami                  = var.ami-id
  instance_type        = var.instance-type
  iam_instance_profile = aws_iam_role.ssm_role.name
}