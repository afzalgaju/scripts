
resource "aws_instance" "ec2" {
  ami             = var.ami-id
  instance_type   = var.instance-type
  security_groups = [var.security_groups]
  subnet_id = var.subnet_id
  availability_zone = var.availability_zones
  
  tags = {
    Name = "Ec2-Efs"
  }
}
resource "aws_efs_file_system" "efs1" {
  creation_token = "efs1"
  tags = {
    Name = "My-efs"
  }
}
resource "aws_efs_mount_target" "mount" {
  file_system_id  = aws_efs_file_system.efs1.id
  subnet_id       = var.subnet_id
  security_groups = [var.security_groups]
}  
