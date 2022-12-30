
# Declare Terraform output for the Auto Scaling group name
output "asg_name" {
  value = aws_autoscaling_group.my-asg.name
}
