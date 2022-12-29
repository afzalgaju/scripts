resource "aws_s3_bucket" "mahira1" {
  bucket = "mahira1"
  tags = {
    Name        = "my"
    Environment = "bucket"
  }
}

resource "aws_s3_bucket_acl" "s3-acl" {
  bucket = aws_s3_bucket.mahira1.id
  acl    = "private"
}

resource "aws_iam_user" "mahira" {
  name = "mahira"
}

resource "aws_iam_policy" "s3policy" {
  name        = "s3-policy"
  description = "my-policy"
  policy      = var.iam_policy
}  

resource "aws_iam_user_policy_attachment" "s3-attach" {
  user       = aws_iam_user.mahira.name
  policy_arn = aws_iam_policy.s3policy.arn
}