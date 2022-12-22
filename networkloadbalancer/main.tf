resource "aws_lb_target_group" "nlb" {
  name     = "network-nlb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group_attachment" "attach-nlb" {
  target_group_arn = aws_lb_target_group.nlb.arn
  target_id        = aws_instance.nlb-ec2.id
  port             = 80
}


resource "aws_lb" "nlb" {
  name               = "nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${var.subnet}"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_instance" "nlb-ec2" {
  count = "1"

  ami           = var.ami-id
  instance_type = var.instance-type
  key_name = var.tag-key
  
  tags = {
    Name = "ec1"
  }
}
