
resource "aws_iam_role" "iam_role" {
  name = "iam_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "iec2_profile" {
  name = "iec2_profile"
  role = aws_iam_role.iam_role.name
}

resource "aws_instance" "iam_ec2" {
  ami                  = var.ami-id
  instance_type        = var.instance-type
  iam_instance_profile = aws_iam_instance_profile.iec2_profile.name
  key_name             = var.tag-key

  tags = {
    Name = "myec2"
  }
}

