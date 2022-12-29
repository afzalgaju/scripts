# Output the ARN of the IAM role
output "iam_role_arn" {
  value = aws_iam_role.ec2_role.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.ec2_policy.arn
}