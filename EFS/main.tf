resource "aws_efs_file_system" "efs1" {
  creation_token = "efs1"

  tags = {
    Name = "My-efs"
  }
}