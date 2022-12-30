resource "aws_ebs_volume" "my-ebs" {
  availability_zone = var.availability_zone
  size              = var.size
  tags = {
    Name = "ebs"
  }
}

resource "aws_instance" "web" {
  ami               = var.ami-id
  availability_zone = var.availability_zone
  instance_type     = var.instance-type

  tags = {
    Name = "ec2-1"
  }
}

resource "aws_volume_attachment" "ebs-att" {
  device_name =  "/dev/sdh"
  volume_id   = aws_ebs_volume.my-ebs.id
  instance_id = aws_instance.web.id
}


