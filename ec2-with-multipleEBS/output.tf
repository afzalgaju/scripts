output "ec2output" {
  value = aws_instance.web
}

output "ebsoutput" {
  value = aws_ebs_volume.my-ebs
}